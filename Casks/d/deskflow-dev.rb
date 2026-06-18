cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.254"
  sha256 arm:   "3658f7f58fcbab918c799a46dd0fce7aad9ec911de530e8b3f0805b7a0697432", intel: "46a1000a33c493599d1828345ec313162722cdfdb9b99a2fa7362ca14b6025ce"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
