cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.200"
  sha256 arm:   "4505f5963ffe35ce0276f9e3bcd3a9e63bf690e1a8f7c95937455424c034bc96", intel: "f06482dad130d5ec92c17c4659aefe73d0786a7714aa1e4d5e59952db6706b81"

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
