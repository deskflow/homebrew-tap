cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.20"
  sha256 arm:   "87581b7cebf4cee762dfd4cbf2b4032a703a7990a18f84342819224eed8482aa", intel: "f1e83ebc202ad8def237d55e7324299e33cfed4f9b9e5469eb6bc61291d7e9ec"

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
