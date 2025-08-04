cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.42"
  sha256 arm:   "6ed9cd9dcf1c1ce922fd7e569eac50c6564f70e3cb214bea928c059a4cf4936b", intel: "d5c2c473e71fd3b47b4360e8853efb847d3616a2e1256af842a337a4701a047a"

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
