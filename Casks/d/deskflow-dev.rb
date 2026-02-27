cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.61"
  sha256 arm:   "63ce1ffb200f26f65ddfe2fe2f498e25ff0370c0640a7b3d31c500fd9bd2f2e1", intel: "86207ebc83e225e8eb478754d6250559c00de3beeee937d7c8cef0001f3de639"

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
