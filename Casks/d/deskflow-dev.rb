cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.203"
  sha256 arm:   "dc3d4b9ae7a27c11a35143f894946d216060e4c9397531935bc69e48a31d5f0e", intel: "92198d66f13009a29c6517eacdf40a5f3d722215ecece504075b914866d5fcd6"

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
