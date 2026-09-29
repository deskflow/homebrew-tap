cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.486"
  sha256 arm:   "b85f20ffe35dac757c7cadf5e11c4288671f765e364f5b2e482e1c943a0d8852", intel: "a7c13035c3d153a9b80160c5f396f0765b36a6a109379bdca53daa8d4d17c523"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

  app "Deskflow.app"

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
