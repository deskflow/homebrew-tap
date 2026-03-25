cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.94"
  sha256 arm:   "587bf3b1e05cc0758500ec91948bb2f0db84ecdbf7cbea5fbd30e5379b6d3c06", intel: "ca9cc26cb42af7519dbd836f4f93c6806507abc1733e93a590f7b71219795544"

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
