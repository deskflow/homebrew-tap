cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.11"
  sha256 arm:   "21c552ceb11306db6f6e18d63c4153e7bc956e005cbe443d4e5c5dc45bef26d3", intel: "c3ee956e59964fc66bc23e2272039af478b35c041e4d6466a9b561f16a77db1c"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
