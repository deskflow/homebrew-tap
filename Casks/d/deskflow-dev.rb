cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.75"
  sha256 arm:   "821316cf92e08b35625c435e1f362eed034fd9aa0098c6807893224ad035cb93", intel: "d2f541001e9cb89af010fb8d30d11604d293013d4dd0dbb415c2b7056d546da3"

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
