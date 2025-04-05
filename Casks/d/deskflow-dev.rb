cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.1.20"
  sha256 arm:   "5b32caee40fcc01d56326daa9a45c29a4b60fe2f20274ef6c109818f79f7c9c4", intel: "14fd871462b0d0e9a7a9925bfa61f6812b3241ada2fc6b0c65b029ed12e3b986"

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
