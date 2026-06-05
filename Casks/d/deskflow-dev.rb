cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.222"
  sha256 arm:   "8a4479f74303193edd01b205d68193f16f7317540d9af9c679588bb0502b563a", intel: "4858cf8a60305ab57f199ca59fd607608bde60e4450ebbb200d0a7e7296be053"

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
