cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.224"
  sha256 arm:   "9277cee4cb1a9fae6b1c42496cbcda303669cf3b38eb00c3d58addbb6e64ada6", intel: "1cb4c40d29a07b36db0c63cb072f064acd016e603c00ccd91cf66fa7c6563b71"

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
