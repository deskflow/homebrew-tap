cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.102"
  sha256 arm:   "9f09e31ff2bfabbe7260b7c89561ed1f83356e2641b58fbc1edf8772da237721", intel: "d627e9e7c961e5ac4d51cf435fbcae4bd15c0c0d283762c558300f972d00b509"

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
