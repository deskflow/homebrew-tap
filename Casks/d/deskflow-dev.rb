cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.10"
  sha256 arm:   "656e1ff30ebbcc3171bf855e4733711bccaaa8c6d9f449cb5e4c2f60252e78de", intel: "396aa85f0e5c8113d83bdd9504083654e484995117538e277faa4f938ee72e12"

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
