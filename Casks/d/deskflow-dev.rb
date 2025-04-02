cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.1.5"
  sha256 arm:   "af8dcec26bf569c2cedd891618228c3f38fcd093e427496edd3ebf75ffa3ace7", intel: "53803dfe54eb4384123887f93a75a1374cff6e9759538a71000c9e91af4e79e2"

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
