cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.92"
  sha256 arm:   "5e6accc277d32cb6d3621b88d8314352342a6986c8f3e92e5dfb49f8c6cd5e39", intel: "c411a9d7ad79172899e2c5668d77d41d97b7fa2d15ce6083f2eaf901c67e36b7"

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
