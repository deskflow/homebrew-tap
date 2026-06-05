cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.220"
  sha256 arm:   "a8bd27209f8ed09854d1611c12eb7d5233a9934b627a9ed2076ac6af8bdcff47", intel: "3d21908865330360a95a6e0d49eaa6176520ca75e1b565eab1c9fdd44c91f69d"

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
