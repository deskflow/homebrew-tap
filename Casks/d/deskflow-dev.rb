cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.157"
  sha256 arm:   "89ad638c2c9f544d336ab39497fecb460cb6b6b4dc2eda77e43bd56df82129b8", intel: "33a9b0bc946adeb0dcd15d0c1db6eacb0b7bed1e4c9a8917358cf1bd958bd8bd"

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
