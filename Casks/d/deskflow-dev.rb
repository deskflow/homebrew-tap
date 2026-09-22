cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.444"
  sha256 arm:   "d299c5c2ae73962425bbdca477fc0915542852877160535a7ba5d4fc40b6e2f5", intel: "c7578c2e48a8656b33f7c36fe5af6ea01e6fe119c554388db3044136abce291f"

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
