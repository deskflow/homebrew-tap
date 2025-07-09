cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.154"
  sha256 arm:   "4d985183fdfebc1c08f2455a50a6e4f39ba20e9d00afae6902f8681768003905", intel: "1c90690598f11b1dd85fee395d28bff583e53363fcf61d70b1e017243d421c2f"

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
