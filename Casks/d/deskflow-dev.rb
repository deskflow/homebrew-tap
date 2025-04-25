cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.28"
  sha256 arm:   "21fc5f7da4da312bed9e17adf1d92d0582f0d7593c3684c3dd14c9c7ba3eb2d8", intel: "1dd1aa846835364a76d89397164420a4ac14dc6c2712a7967e0ffc838f2b2709"

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
