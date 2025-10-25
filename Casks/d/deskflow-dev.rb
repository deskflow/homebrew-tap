cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.139"
  sha256 arm:   "836120dcdd9eb3a8c7181e235f7f5286205e68276bc658a9be3084dcdf1225e1", intel: "42883f00803b79708ea361ca407d3bd03f265daae61fbf45e1843ce66d135501"

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
