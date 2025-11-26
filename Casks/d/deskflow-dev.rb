cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.24"
  sha256 arm:   "618989d3f154d5a14bf7ee1d237c05e01070763c6f296459296298e792df11e2", intel: "4f074172491f41b5d62ac4bf715090d326abfeac2948343eb430b23135b918d9"

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
