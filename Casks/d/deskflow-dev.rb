cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.396"
  sha256 arm:   "57e58c5a0cadacdafb1a755acb21a5496a1f96f8b508b3c64020b216054e180f", intel: "4c9899a2cf00e0431b69192500fe6dbbb5d2d5b4f56268b32386b99b1c7e2af6"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
