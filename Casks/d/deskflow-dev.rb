cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.0"
  sha256 arm:   "df5b3fa91d657408903c19a7688830b461b64fe56c3563cd1632acd0dd72c89f", intel: "f3929876c3241d006bd264f1cad6bae86c1edb66b4b662f0b0efec509d299d4b"

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
