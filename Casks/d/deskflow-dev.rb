cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.299"
  sha256 arm:   "bf6310843ba42ac200677187a3d59cc6b4d6250c463fd0d98379da27cb45aa3c", intel: "a0b94286b7115bf3aa0e0f0cb38f856a96376d8796e834a355a48400b2c06209"

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
