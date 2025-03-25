cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.198"
  sha256 arm:   "b2e6e8ed1348a8596361eedb8c87a0755d1a379b1d4ee0873d5b1d4d20a797c2", intel: "a0e6b54fec1e659f3b684fdc3bf8abc26e860ef5df62c20b99e4e9ab924f49af"

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
