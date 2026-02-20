cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.16"
  sha256 arm:   "3d590a90cb7d14ce73a97b6065f2023e9e5393c74c7f7322d0f9cae3f367f7ed", intel: "d1e632d520de8b41113d35e9af6dece2eedb1832bd815407aafba158be6c5386"

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
