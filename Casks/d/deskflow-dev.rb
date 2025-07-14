cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.177"
  sha256 arm:   "e3cddf4cdf1a1086cc96650c38abdf650342c8d6fd76f81ef0707a0bf0364a6a", intel: "8d8f92af235e6f5c2fc891305ff8f60c897ef67e2707b506c8f3843530596341"

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
