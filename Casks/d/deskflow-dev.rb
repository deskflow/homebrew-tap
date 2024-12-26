cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.98"
  sha256 arm:   "2235b777ed53bc7c69de5e894be8eefe2dea1279159fe85cfeb7075b119efaa0", intel: "243019109544a9ad90d58e207f21bb5339d939a0154c359a957cb43f74adbc8f"

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
