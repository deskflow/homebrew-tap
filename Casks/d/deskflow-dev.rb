cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.1.11"
  sha256 arm:   "a24d70513aafb318f8bb2dd8b6d99632b0e1283e9a5319f4dde802a8b77a92d5", intel: "f8a01d3ba334b0d45bc676ef94c6230be28ac692a3fea38074aeb4720a13cf19"

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
