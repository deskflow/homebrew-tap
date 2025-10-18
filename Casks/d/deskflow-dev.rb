cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.126"
  sha256 arm:   "cda2e8ef997cd2a70ccfda2f824bf43a13ce15785dbf81f8d421933471894318", intel: "4ec0b0c2d1a974c0c69087b7e41f7ecb4d8a0cb9288a1579e776eaf71dbed673"

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
