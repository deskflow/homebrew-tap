cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.4"
  sha256 arm:   "030e66dd3124ca2898dd27835aab91f6c54c6943e3eb2e7adc3013458f2db6d7", intel: "c35f8a618aa059baea55d04fbeca253a8a0f9cfb3976e8604539b59fb0f6a50b"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
