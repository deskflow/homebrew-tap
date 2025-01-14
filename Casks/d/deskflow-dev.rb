cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.86"
  sha256 arm:   "1f5177ca5ec7c7252698819a54abc0e10288ea3daa2ac3a20328d923d69081fb", intel: "1ab17f67f5481b7d50875ca5c0587eaf963aa0522ae8d6e56a7657f44d24851c"

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
