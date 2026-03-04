cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.67"
  sha256 arm:   "9d7c354c33f69745b45e25090e4b34258f5447790818bb610db51eae62a61caf", intel: "9fd33373561d3b9a758b2b51aebf68657b034953be80d7c7db856234b8e34b63"

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
