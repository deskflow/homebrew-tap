cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.68"
  sha256 arm:   "3fee471224eb349a934559ad6e1d4365ed500917cf53c6eb901e0e28f570faa5", intel: "f2845f398a106a7bf8a4e18fae65250f0a867e4c31f965af7d8781c0dfe0ef8b"

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
