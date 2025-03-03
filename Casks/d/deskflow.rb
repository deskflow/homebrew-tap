cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.0"
  sha256 arm:   "b68dad8797b993eecef751e11156bbaf6ff7073dd0faa5e1fcda44005bcbce85", intel: "44734d0caf05f6aad5275b8904422216c3aa736bad8a6c7cae658439a076d29f"

  url "https://github.com/deskflow/deskflow/releases/download/v#{version}/deskflow-#{version}-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow-dev"

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
