cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.69"
  sha256 arm:   "467590288e8dfbc9282ed275298fb2b5d73a0e44855dd6f257225a298d386409", intel: "5eca6b2e01bae376e18aad6285ec8e479e14f692a30f9c0fc92e74c60e21113d"

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
