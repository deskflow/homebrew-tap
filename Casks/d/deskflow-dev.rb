cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.236"
  sha256 arm:   "b9b8510bc49066ffcb40a32a263c01c1a717eefea5cc06d8752bcf2c924642eb", intel: "fe3022c6ffb7b7da83f8e6ca234083539e1a50ce52e665df87b893f6e3bcf5f0"

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
