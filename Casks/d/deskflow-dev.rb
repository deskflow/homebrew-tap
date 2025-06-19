cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.76"
  sha256 arm:   "619047d35a08e2c14d9f30d4d1854185fbac1e4fcc853db8a03cef74201d2519", intel: "d82753e5255b8061655576293990e859c528a72ec5cfb9cd49ddfbcdb903e03f"

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
