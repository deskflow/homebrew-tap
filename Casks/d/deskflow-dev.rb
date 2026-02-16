cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.256"
  sha256 arm:   "8efd218e60df7f133712b3d5e767b9ee4e6cd5103f4b3273ee03ab9d32be1647", intel: "012cd63c1d8c993ebd001cf34842806939a5f781f107ef01f5dde5aee1377d15"

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
