cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.240"
  sha256 arm:   "b8d27768156e4cc0ad8ec14c13b1bdda8e048f84defac10a079590d25d9e13e8", intel: "0ffbf14654bfdb2fb6cc2dfdfc319af4969e0ba3b8c0707dcbaecdeeb3f60f5f"

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
