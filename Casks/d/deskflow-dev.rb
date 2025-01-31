cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.0"
  sha256 arm:   "edd798458f1bfc7064dd2e2011c12c7f18f0e2e516b8c6eb4fe496f0f53efc94", intel: "2beeea3c2cdf5408dffc0fbc820e748ef44103bc7eff6c1e43d6e2fc4b035c97"

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
