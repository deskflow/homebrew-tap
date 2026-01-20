cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.180"
  sha256 arm:   "2d56676aea7e42b5b5099335670d6f43a6cd330d8e50aa3401798372af46eb31", intel: "cde891e9dc9034f9ab93a0b569a47bb734814b80b0d100ff546f60d6a2630f07"

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
