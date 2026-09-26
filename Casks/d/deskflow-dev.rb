cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.472"
  sha256 arm:   "4f6f1cf8a32533bac54878ccbbfe594e3a127bf10133952ee5b48a721fe9b6cf", intel: "67a03e48d7752321b42aa781468d3fdd39249727bcb48b9baa4989727b12ea1e"

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
