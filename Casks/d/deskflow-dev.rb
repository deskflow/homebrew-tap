cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.108"
  sha256 arm:   "b553184e0f24bd3fb571cd05c132725a82cfe684d9e79d14cf52e6cb13967c7b", intel: "eedcb48467d9b33da7e79acd4732a0328329dcefa98cb390b717d3e8b1dc992c"

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
