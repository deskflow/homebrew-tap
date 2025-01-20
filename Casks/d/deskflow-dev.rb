cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.97"
  sha256 arm:   "946e6ca090d5474b9e0af10a23b38e88772c5f028a48655c3427a1a81d17461f", intel: "6fdd3acad6c47db7791061020eeaec8a7988becebf0aec747d1b86b690339eb8"

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
