cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.142"
  sha256 arm:   "7515413e41c9fe0c5013bb1d127a496e9da8f15a36fcbeb259d0a5110f3b90c8", intel: "08571f1f9afcf21821269e26a8e183e759c63c8ed5a620eedb022a94ad1ef7c4"

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
