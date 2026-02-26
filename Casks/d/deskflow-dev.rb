cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.53"
  sha256 arm:   "fdf8a0fa711e0775052715932215407d26d3593b5c961f1658daa6d6078c04f5", intel: "c3e09a5d574e47b20bf75955be4257e18b3fdd29d02ec87e6cfc510769fa7c9a"

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
