cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.14"
  sha256 arm:   "5edc6346d079cfc251db0d848c8045ce4bdd6f794e22879baaed681d899ff4cf", intel: "270301b0609ff5768b1cafff3345ea10f2bbd80548a7e8e5564e1627bcc8bb62"

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
