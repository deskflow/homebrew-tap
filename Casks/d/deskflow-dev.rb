cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.80"
  sha256 arm:   "d56b032f20803ada21155922d9c990baadd1f15d69d41dd8d8a8f22805b47dc5", intel: "5af09f5d1f4ab553b581ee2a9823391bf1654c7a2d2796413a0b318b41aadf95"

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
