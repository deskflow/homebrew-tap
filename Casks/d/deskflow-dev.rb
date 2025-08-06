cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.65"
  sha256 arm:   "0cd37b668237807cd8b76d0c583f8168922edf3b0888f41ece5c8c44c1263b68", intel: "318b2baf652d0410a42c6c15e1b357d12c79c7da8af71e3c283fb33ea6d8163b"

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
