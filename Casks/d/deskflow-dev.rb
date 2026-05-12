cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.179"
  sha256 arm:   "6444660aa84872c2357c7e5b3b57556bd5244d49c3b73fe5c6233e9eff72c199", intel: "e71dbf3ac963aad84a9959385b810f4dd860f01a9996273a90d1965cf0c5ed27"

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
