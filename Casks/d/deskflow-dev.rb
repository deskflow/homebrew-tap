cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.211"
  sha256 arm:   "58dcda3f995f994a4b4530f43d7aa8b3020f23703936db76f4887535dbafeb3c", intel: "2034f5f0932f78ad691fee4faa445b91d3b6477d906955d3698bdee35d8f7957"

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
