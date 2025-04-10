cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.3"
  sha256 arm:   "b8e2cdeec5ca2bdbeb6af059e73d94614c846f205e54a9a7b51812715394b1cc", intel: "a9509bd42dfab7538b22df17a8b8f9f0486e7b7a1131aa37e22d0c2592157a8d"

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
