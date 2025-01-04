cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.13"
  sha256 arm:   "b1a05129806a8ee6858ffdfd797e9a7509b343f267bcd73b01efa6ff9077b9c9", intel: "226af159799ab42d81f2a377e7ff1d248ced78b8645f43d8423ad12483aa9b2d"

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
