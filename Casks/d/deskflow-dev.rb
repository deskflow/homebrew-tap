cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.210"
  sha256 arm:   "ea66053c3ca9092530d30e41a97c76bab7e30637d692df968fd3c40f54eebd5a", intel: "57596c53f20815ad9fb656c5151bffdbed0854f5852828500e01cbd37eca13b7"

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
