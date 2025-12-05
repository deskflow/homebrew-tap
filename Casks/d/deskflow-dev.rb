cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.67"
  sha256 arm:   "dc30d9419f238d736b80a4e506cf57193541233aad7ffe70ac5a9ebba56501ee", intel: "cc59a4494e24da59b1bcfd112091e13ebb66c7c7ccd092e21cc9ade673ee7cd1"

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
