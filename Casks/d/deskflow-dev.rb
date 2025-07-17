cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.194"
  sha256 arm:   "1ee0fce349189d46f2b3b9bd1aeb675ff1a54b24a59ebd44f83edc618a80ae79", intel: "499024af1e78de90ae3a6e18dc078f2dc5fb18f60282958dabd752c4af49c578"

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
