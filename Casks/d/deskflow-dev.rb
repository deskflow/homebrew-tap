cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.329"
  sha256 arm:   "afe25138445fef6d5a0aa476aa4ca3b1b3148ee458636b4f0900a6fa1598def2", intel: "f1d6a20307b343433af6676543e16b72bcc4098e296ce0f5441683c7127fb1c7"

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
