cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.165"
  sha256 arm:   "8604b5b78534c5a22ded7062440597bf5962d3604e91fa74175e8ac01ffa9a65", intel: "fe5fbb857bd3647e39aa0e63a4a1deb1333b94b5b548d495f7f59aed0fca8fe1"

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
