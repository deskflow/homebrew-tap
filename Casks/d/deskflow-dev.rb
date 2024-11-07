cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.0.186"
  sha256 arm:   "481e6c365a78d2e040315ca002dbc2d572e9bdb90847ee7ba12b63bc35fc06c1", intel: "2e78761ab1cb2b9977ef75e8a49f2d753c33859a7b36e69dcbb2758e2a138912"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
