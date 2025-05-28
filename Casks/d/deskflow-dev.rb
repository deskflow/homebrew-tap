cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.283"
  sha256 arm:   "36a806a34c2cc7869dde650a13d6c8acae5636adca5e359c21a58ec18ed92c82", intel: "8a54d7ca5f167a0bf774c3ffd59a16fe3142f4cf9bde19066ce41345684382eb"

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
