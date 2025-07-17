cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.178"
  sha256 arm:   "31e9f739da3777deed3e18c252cdbbfe58d00e9452c393857fe868b61feeb423", intel: "ac7692eb19ac49bbcbaf15eb35db994f8065bca5823928465b9007795c794a6e"

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
