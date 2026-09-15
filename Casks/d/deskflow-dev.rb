cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.438"
  sha256 arm:   "52d9d68ed9313382216c6712f8d9338e5e01e42cc1ceffa1a76cbab7316698e8", intel: "0703a1eca36c19a5eaa6e077bcaa9a8e1111eb979fed543a1dd71d20087b8dc3"

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
