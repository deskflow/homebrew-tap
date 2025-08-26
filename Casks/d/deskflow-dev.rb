cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.148"
  sha256 arm:   "56a81b657ce48124312c4830d0aa0783364c527c8cea6f59eba1911e01dd7261", intel: "518ac23ea45ce66d264b3b7a616ebe95542ec1f6603364ac9b3a92b8b0d64132"

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
