cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.443"
  sha256 arm:   "e82f8f457ff5bff830b6a7b103e022c14df4644874debbcdc636a617f86c97e3", intel: "73c371e103d05a5a2e292152274ca5b6c98f3de8b42b1611004e974afa4e0ff4"

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
