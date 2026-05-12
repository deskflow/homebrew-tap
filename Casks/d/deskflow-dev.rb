cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.180"
  sha256 arm:   "2122966ca4dfb18c7a81e89d54499bf228d84ad0f27ea0733ba51fc2395fca4f", intel: "e2c2308441ede43f616bf92fe034c04ebded4ab2bab33b76bad50edaa8b80c3e"

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
