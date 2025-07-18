cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.196"
  sha256 arm:   "ee4b82d37d975d0b70362bf8961a63ba2c67f64760b2b4e1c72797444fe89c85", intel: "43946ffda899a380ca5f80fc2bad3dc8c825b8e8104644f594275313b518c4f5"

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
