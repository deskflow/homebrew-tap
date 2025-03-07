cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.0.28"
  sha256 arm:   "367861e499f02c9da327d5ab4a3ca5f24139707bb727e6f132e950e3faf136b1", intel: "716db867382a79ce4925af9402d93ad571e5d36a6bcc9f15350b315fb24dd2e8"

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
