cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.5"
  sha256 arm:   "88dd11442d1ede126354940610a1f99b89e3c238acd5ebad8c0b30ed7a235f3d", intel: "9041fc171165dc496b85be2c2227bdbd6ea9d1c98443ccf93750c2a2f4cae70d"

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
