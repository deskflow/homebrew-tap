cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.62"
  sha256 arm:   "474b666e7624e71a9289b0a8299ccf61eaa6e6fdf3581b75ec9800420dcd31c5", intel: "f87625f0ba44917d624521f5407cd2c31f20cbfb8622b6918fa0bbbf370aade8"

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
