cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.88"
  sha256 arm:   "3de4e7d3925c4024c1177acc53a5bf262390c1ac3119507e7bc9777345c1fd2b", intel: "164817030075efb1928f737b74d5d100d8178ef09a45957f963d6afbd78e040e"

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
