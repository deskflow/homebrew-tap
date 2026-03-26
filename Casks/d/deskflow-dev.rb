cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.96"
  sha256 arm:   "7160c7ecdb61cd882c176f325f2cd036a68dcc5dbb300e3bc8c2d40fabc75972", intel: "5cb921a36b6abcb1da7ba86cf86dc1358a945caf1651a0dfcdff4b3e27887570"

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
