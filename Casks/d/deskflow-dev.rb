cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.163"
  sha256 arm:   "cbfaf991a31d9314ba467bae58d2557758bad04d864cc37d299db5af85720228", intel: "dac2495df059eca82832b92de6cf997bbc744b9460c8c71a223115a9281e53db"

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
