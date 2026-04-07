cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.114"
  sha256 arm:   "3f4733aeff28dac2ddf32ffdc4f9e4e3bd2ebbf307e98b3e9ac9ba171ce23f06", intel: "3b8f61ff1657eb2cb880899997afefe72d620145d57b5bdbb91f8fc9eea2611f"

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
