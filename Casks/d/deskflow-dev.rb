cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.24"
  sha256 arm:   "eed78c5f857819c5f3bb8bc3007a0fcaec2faaaeeeee0dc8cfc1c9bbbee2684b", intel: "0a134bfa51c9dbcb2c33577eb226eff349fa0a828a3bc62e1b00914778c5f124"

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
