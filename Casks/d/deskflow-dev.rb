cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.114"
  sha256 arm:   "1be95eda5d2967b7e0c65b584f8261cf2c74c1e73f8b92e62898a7c26817576e", intel: "06d00c592527da08b7da7dfba4b42926b32b95fc00a0b644c60f889caca38c23"

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
