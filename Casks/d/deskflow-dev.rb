cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.144"
  sha256 arm:   "e7a5dc973cb1149b9f38977a8a8e891d676ec57a11bed2c03a91af7ed9b5f232", intel: "225bc7072fbc69a5035f86a7d5b6b1a6a2c9f4d56edcdc49560bbced667d7b54"

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
