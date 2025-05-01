cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.98"
  sha256 arm:   "d05d3d5d69c78b4c62e203da7161a832dea68413be877cc145e2d0e4b1ee0c9c", intel: "e6b2244120bd7d3e48bf65050c20759e833263caf4ce33e6c6ef9c27623fb93c"

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
