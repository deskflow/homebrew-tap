cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.191"
  sha256 arm:   "c7b4b97fa1c37e554a3d14bd15dc532f325ab04e2d6ea692accfd6079334c0dc", intel: "c202cbee5ffff8481e850aedd90f4c5e0059523bbe5b0b4e88af2ef7e606efbf"

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
