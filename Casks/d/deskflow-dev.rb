cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.0"
  sha256 arm:   "452d2a54cc0d1e4ba087cd9ac752d1a20f63e2ed3635493282133ef87eee2db8", intel: "88690a1b794bc7d9eb5d53e115c2516ac9b8b81fa793aebc390564458b7cce2a"

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
