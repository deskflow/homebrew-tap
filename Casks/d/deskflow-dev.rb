cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.29"
  sha256 arm:   "71b67b8bec58653cafc0aa33fcd3e3e41d9282839bd717838ac141dfc1be9e96", intel: "5cb78868ff4e34fdfa10975e469b4c3b0f4ed5c814f19967822947ae6e7a3ba3"

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
