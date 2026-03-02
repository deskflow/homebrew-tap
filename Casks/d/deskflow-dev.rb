cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.65"
  sha256 arm:   "017e32f2bdd6ae4d42a5a76f43637ddf06ba075d84001b230a4fddf4a6f96055", intel: "76c465f966a1011dfbed9b76847508564c9e0da5b4bdf798b7fbe47afd0e40a0"

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
