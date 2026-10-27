cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.20"
  sha256 arm:   "8836ea14dc1518e5aa0cd8751cba90cbabe3d67995b733b1f773adaa91ddf95f", intel: "827bace162e626c9f4643d9e683e47eb623b6a59d6414609397dcb46e827871e"

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
