cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.135"
  sha256 arm:   "723b92a0155c9a1549c82ed2d549c91392d5c6d76962c4e3320751fc901f1832", intel: "f4541499f8f668e66741c57f7f0c92961fbff4f9958a41b5d7b0436160a9a801"

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
