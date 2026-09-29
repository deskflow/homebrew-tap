cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.485"
  sha256 arm:   "3714895bb478344629ed7e625d8f57b4d3af58d9cc05e0664683d8795421b643", intel: "5189b7c7043a641c377145225416908a22a4fef0b6a65c2373f59b94589c2309"

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
