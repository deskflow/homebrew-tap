cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.436"
  sha256 arm:   "dd9e47733b686d3857081b701be0a893793c304de22812f3caa148e5b4de3acc", intel: "fb67f899d206dc004e5bba0cab954443617464c1940603c6e3942d9146af1e25"

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
