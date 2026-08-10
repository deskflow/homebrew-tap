cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.373"
  sha256 arm:   "a1628ae47839fdf1821b6247cb6e496b7b7eee1103bbcadb982b5538421bf8f0", intel: "e7746db5bcf7149f75cbd513cfc68d4ccc67ec20a9b443965407571ffcde9214"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
