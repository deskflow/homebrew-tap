cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.252"
  sha256 arm:   "f472d2d6ba515ccff8949108e75f8974d2d1ce1f33574c6f96bf870885986e32", intel: "52e7a5a919dd2521c7fa16f42d4b019ddeee26755ccdb226a2a7447d58a77d61"

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
