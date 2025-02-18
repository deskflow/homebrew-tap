cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.62"
  sha256 arm:   "822c5217cee773ea4b81080a97634bdf34ad9cc20293c288c19f8bce90173faa", intel: "fc5011c8b22466cc46f2de8e1edf7df553097cf53d885f060ac8421d7e9cd7ba"

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
