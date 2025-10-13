cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.84"
  sha256 arm:   "e774f56ed13c2a6e8ce8faa2cf35f1bc967585489b90656ebdde013118ddf1ed", intel: "e4f752973daddd25dacbc1b78ccef1523d2c7ef3bf562cca645bd0adf10bdda4"

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
