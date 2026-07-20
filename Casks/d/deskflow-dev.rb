cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.325"
  sha256 arm:   "bd37c35fa1e65c2fb3375124e36498763924a4b872b0f83965ec34101a291b5b", intel: "0f53d56deb236a20b5e83c436210ecfca2dff5c113563789dccd35cd336b22bc"

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
