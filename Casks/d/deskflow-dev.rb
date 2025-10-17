cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.115"
  sha256 arm:   "9cd39cbd3771a6cfbfc3904cc2cb33562e4f1060fb657c2759ae7b3ec18857b8", intel: "fa1e2089d30b217388a0c1d2368cf4a4e0014b14b1f7d5b6d7e8acd70e9218c5"

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
