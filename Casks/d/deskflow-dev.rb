cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.9"
  sha256 arm:   "49fa87401a84376ff40417c8e4c26541f9a7857879757a475c9e7d6c0793048c", intel: "53b23efe5c5ec0b87e9adece91e9632cbf968f225d1dd6a2e6b203a1c6745dff"

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
