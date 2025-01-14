cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.82"
  sha256 arm:   "10580298a90b350fae13be1f69322e21170eb9cc6c4948ea4050622ca6e96738", intel: "9262eb4bc6665edc8f8244593e553c5079b2006239071d1fbeea88ff0d407201"

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
