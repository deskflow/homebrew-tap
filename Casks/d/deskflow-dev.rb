cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.439"
  sha256 arm:   "ae8667b4b38a9e75e23161a8bf1d37712c52b0e3bde42109d953540bd4ce7235", intel: "95af62fdb460eec13d22b70500506b066023fcd30ca99e136e608a014338ddac"

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
