cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.7"
  sha256 arm:   "15af451d7fc80b9d72357fdfc376aecb8843fe2d961289fec7683cd9d6ca1002", intel: "7f4ebf9fdedcf6941cc8d87c9f6c1d8394713b70a0f83c17aedd6791a559c471"

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
