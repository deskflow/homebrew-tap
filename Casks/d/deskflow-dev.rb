cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.24"
  sha256 arm:   "c940289d8c780524b758ce22699b0f3a506bf7622189d491aa4fe417c3a556cd", intel: "87d0789a81b4d7fd2d58a2a4a950bb27707a2da607fbd9e52482076084a646da"

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
