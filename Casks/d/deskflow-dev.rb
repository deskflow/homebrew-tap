cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.333"
  sha256 arm:   "2bc72265521b62de0b4b65bfb126960e041d786b94a27301b8dddb68e01011ed", intel: "9ac15065c44d414a5baa1197bb62da9bb303a44063d09106aba27a86ce57ede8"

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
