cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.63"
  sha256 arm:   "0b844250b81150512bacc31b31921025b5ef0aba616f63287803e39cb02048c4", intel: "fbbcbdb1480db44fc78bafcbdefcb63fcc7d6b3ce9a62500ed995ed0f883694e"

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
