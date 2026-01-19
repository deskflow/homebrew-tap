cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.166"
  sha256 arm:   "004c8f6fb841165c2f0b5838deca85f767879f8c97786ec2e259ae9eaebcb2ac", intel: "4196c7dd65f81f9cf7e13cfdb28c8e3cb3849e30274b18c7f3bb9fd768db7693"

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
