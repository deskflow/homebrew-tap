cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.0"
  sha256 arm:   "0e28afbeabef4001ab751230876b4fee7a5850199f7fce7a0f08a0613b3312f5", intel: "1af67344e722dec2e8cb8a415b2689456b6a3c3cc5a3bab34b43fb2cc3741ad8"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
