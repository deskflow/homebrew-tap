cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.0.2"
  sha256 arm:   "4c7db0649a2729bd3044ffe4ffecdedb97a8b68d0c31648f68ec09b89a160279", intel: "905046176f022456edfdb93c4eaf55c29f8890cca8ff592fab5868bb7ac636f2"

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
