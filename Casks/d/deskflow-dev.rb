cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.464"
  sha256 arm:   "1481ca595e1570671e45f30545598c96d90b1da6602f770f752c4d9e16dacc7d", intel: "2a2bf977011e6b4306a050a7b84d8da76c5533f04a1588f319c7c528825c1f96"

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
