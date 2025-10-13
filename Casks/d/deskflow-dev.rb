cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.103"
  sha256 arm:   "97d4a95a5b083a883c8d2d37075af46819b73301982fc1ccefc6989307c27562", intel: "834ffc690286d60fe7c0691a7bd784f21cca51cb181251a75e90354b946d9144"

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
