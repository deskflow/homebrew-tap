cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.18"
  sha256 arm:   "cbfc6d5efb4c94a4af7a92572800974429f4d26bbde3a590a9838245b3acd7c2", intel: "c5d5283bfa60d7bd5bebe3718a75f48d4fdb25a11bf6d9bc8f6146c44927a07c"

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
