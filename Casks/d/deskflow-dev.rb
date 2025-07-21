cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.199"
  sha256 arm:   "9d30fb560a37c3a5bfe7f2940240bb20c874ba943daa1adc68f20d49708a5479", intel: "51b9424b32f9f7e73503af79a606c904e368eb577e76d48aaed7385cb7687b0d"

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
