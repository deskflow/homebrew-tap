cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.189"
  sha256 arm:   "c0309b2d363553bd34c40e58ceae6044d2dc9f526679b2a0a1bad878dce872d9", intel: "9f8e6b98e68b1000e8e65e9624327e6adcf8c8837406d73c5cf8517f184f4266"

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
