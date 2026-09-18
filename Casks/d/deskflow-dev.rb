cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.440"
  sha256 arm:   "d4b93aff23852a286da224ba042a3063739ce072abc77c2021d21bc5bcaee396", intel: "ad041a124bf5b280c23e04649bb81fee7c9f7c1b780d44f58e271bfb9cadb68d"

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
