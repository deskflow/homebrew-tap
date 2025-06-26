cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.106"
  sha256 arm:   "8478674f05ecc8b74f01bb01b2648bb99380a87beb610875cad1486e7c577676", intel: "7e027e83086354319037fa04f3b8a98934c6d09f8984cd90e1726ab878fdccf4"

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
