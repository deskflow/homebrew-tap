cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.413"
  sha256 arm:   "652a8e417dcab366760d3a1e3aeba992288b92dad05f2155efd6ab4aad8f676c", intel: "74412259ace9ddbba6e38d21804999f0dc618f20a5f2b8a433fce86311e33726"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
