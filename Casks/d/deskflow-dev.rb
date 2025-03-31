cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.0.12"
  sha256 arm:   "aa2e3bacda8f3e48271485bef4e33cc427b63c5133cf30faa17b9add582f71ef", intel: "d226649e2373e02be50c8f8cd7f4f308c922db29f70ec50a85cbc6307396de60"

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
