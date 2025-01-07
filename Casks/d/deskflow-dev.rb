cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.31"
  sha256 arm:   "13c293e5cf792d470e9791c88b27a592598bce5a5b152c2278aa5393cdd18ec6", intel: "eec0f2bf7b9433d8b84632a279ee6cb922f990b528afa4ebf5cf571fc92e1ea9"

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
