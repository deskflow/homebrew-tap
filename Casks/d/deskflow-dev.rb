cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.28"
  sha256 arm:   "1961f0479d809f39911f5ea442059308673593b182bb32794733fc05963dbad6", intel: "41acd036185b30210fa248f009e322451408365e40ad1ed5e4ddaa303f0eb016"

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
