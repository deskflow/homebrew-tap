cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.1.21"
  sha256 arm:   "de9de0b35881e66fa244cf7fabec8d45500af9249ab05989a46ab7f75799497d", intel: "3769cbbf5f8305e87a3df1ae67014ff19872df2f23f8392f7b50836f12c89026"

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
