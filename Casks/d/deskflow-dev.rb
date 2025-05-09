cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.219"
  sha256 arm:   "90e3d4837eff63f765626b0515bfb88e7182108ad5c07a653c00e4e589520916", intel: "f1afd45db56fb41626d88a1728da96199c1b3f47255264d6d286ec5facf01dc4"

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
