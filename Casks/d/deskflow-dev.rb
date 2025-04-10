cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.5"
  sha256 arm:   "4cde68fa4b53e8902a6d4b4c1f99edc503175dcac16b6cc6f0d570ba991ad134", intel: "e1edf710c7316b09b416b9514792d940ead8f8589fd689a92f1cdf2ae767b792"

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
