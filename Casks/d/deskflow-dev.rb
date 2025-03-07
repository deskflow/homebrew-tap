cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.0.19"
  sha256 arm:   "66ae060b4e8060cd5e121bbad8afa8a8feb6174131d57ceb426e69a0e9f1311f", intel: "1aeef43964de6b89496e309e643e7233385b289dbdc46c84db0a157ab9955338"

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
