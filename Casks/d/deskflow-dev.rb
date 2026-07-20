cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.321"
  sha256 arm:   "91e6c3a647f3def2a9daa11fb52c54a20caf781b7cfe9c205b5de7951c148673", intel: "f68dcbdb241b1c8ae40bac90da4a9a49d3a405427200240492986f5f28ca33a6"

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
