cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.471"
  sha256 arm:   "e210f720b851c0ff83eb8c25d11b1a79dfd2da357d6ecd52366c27f0d387f2b3", intel: "247d8c7c9dbc7fd5581715f3208f679864a3d90365765ad01a20b73f393836a4"

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
