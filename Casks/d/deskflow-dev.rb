cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.109"
  sha256 arm:   "efb68d6e785c3967bae1654f869fb425d9f9eb264cd844c827fff5b22c72057c", intel: "c77fc55f563285467b71240feab9b5a33c36423dde7b99dd53d7192435a919b6"

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
