cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.203"
  sha256 arm:   "cb5896dd77490dbae0227cf47ee01bf0a29ab9a0155f75eecc108a6aa98c2b45", intel: "97aaf6ce486ee5383f700141ccef93d18e6cb121f43369be96959a051e5bf675"

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
