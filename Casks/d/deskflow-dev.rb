cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.157"
  sha256 arm:   "2a6c35190c5da1acd840d3fd2b10015f6e3880725f688ff50855c0186a49edcf", intel: "71a33f90b02ab1eabc0f83465462a514ac398b19dc13ea719902161f0221e62d"

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
