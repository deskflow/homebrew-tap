cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.1.23"
  sha256 arm:   "ece90ba1200bf8ec755dfd94b3d83a334728449bc82fc609262ee1d24487696b", intel: "5152bf8477d3774ff356623032fa4fd925d5cd4b46feedda024fb93c5dbe7d87"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
