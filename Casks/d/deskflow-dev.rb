cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.203"
  sha256 arm:   "11216a6b8d912350dc7943fa0fe91208e9820e49d1a9327412d410b07ec3384d", intel: "03ea549a298dd0998b22f795324640fc370cefaf0e218e4245628f11dc008157"

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
