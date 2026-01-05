cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.146"
  sha256 arm:   "29ffa5a5f640a94d610d3692e59d04cd8b4fae38e8635ce86c53d67a719afcb0", intel: "7826284b34ae4a20bce6ff6e25e13d7cf65922c4fec7638de1939ba1e809e801"

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
