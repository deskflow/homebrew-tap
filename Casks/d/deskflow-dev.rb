cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.72"
  sha256 arm:   "2a81db89b7372d5c20b5c10ca6366b695baae96d19235ce3b6ec7563f77fd24a", intel: "2b2f70eb6bd3aac9fbe7b6957bfa13e43ec8a6decf372e9504f996aa7813a2cf"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: ">= :monterey"

  app "Deskflow.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
