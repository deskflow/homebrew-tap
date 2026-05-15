cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.197"
  sha256 arm:   "367270dcc907baba40813bae2c495c437cb1856a58184e39dca296a09ba47f1b", intel: "dbb292a77f60475d4c848bcfdcb02c8587a04ea305b50612d7d2c3d6770b48fb"

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
