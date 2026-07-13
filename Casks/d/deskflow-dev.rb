cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.312"
  sha256 arm:   "001b521b50d26bb27a35a2d31d66551cf94f0c10d27d81affa06288d76748807", intel: "a709ae1b3c7c5d79146547b4e76f3656f167ef4040fb7e5aa31d93e04c98e635"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
