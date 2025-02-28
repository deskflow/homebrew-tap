cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.154"
  sha256 arm:   "996364fe82a6048ef2dca9935fbaf5be5264b61531638d2e802676217896ed7a", intel: "590909e5687ea16c410adfd6cf529ebbcb91125aafbabd15a25b8a217cdd0b0f"

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
