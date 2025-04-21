cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.21"
  sha256 arm:   "aaba10fe30f062e2f93b0cf396676420259c68123ce4421ab09a863391f2eca5", intel: "df1968e39fd4fb8ef78e882ae35318f1ebfefe14d0a009f11eefaa2c534d9b1a"

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
