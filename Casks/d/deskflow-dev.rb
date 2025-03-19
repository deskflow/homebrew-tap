cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.125"
  sha256 arm:   "4ccda010d8c4e74daf23c9dd0e2be46918a1bab41ac5192529c88aadd05d77ce", intel: "c382c01004660db2caf97c3399a61a138f31a93862fda39a6fa6af6e0baba3b5"

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
