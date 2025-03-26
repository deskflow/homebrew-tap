cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.222"
  sha256 arm:   "1d9248b5b784f6704b489cdb7b7451606d1d1d5b79e68a78ab10fcd9d89bbf89", intel: "219d7ec6f2018ff14b9cbfe38415d38462400e698a0387476a46bb13fb523a6d"

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
