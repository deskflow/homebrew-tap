cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.98"
  sha256 arm:   "9ba23ed11486bc5d06d5b0ed131687bd561d0cfcb4457f6b14255a01c49419e4", intel: "6b0c1fb4f1a433778ffb61b1d690b7c10e4f14c190c7a6a05b79db2cc463b960"

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
