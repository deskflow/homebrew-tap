cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.34"
  sha256 arm:   "cf018259589f655d726b19d5767e8924a7b37af787476d02c9918dd033ecc3d6", intel: "71fd54e9ce5fb8b46fb1fdf7dc80c795c962d7ea9d57c99260bf8dfc80b8d47f"

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
