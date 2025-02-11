cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.12"
  sha256 arm:   "fb6247d7dfcb9196cf1021f7fafa77616cade2cbd2df1dbaaaa65302d23ba2ae", intel: "f5296bed36aab2b0a476f3c827de1663561774072dde17d359972c5542630f08"

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
