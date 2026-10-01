cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.0"
  sha256 arm:   "fc92d9a6ece3e7c054571cb2a32dbf1a65c8449e6edad53e7eba53e77b2483ea", intel: "8cf4654cf0a653ba0a587a4742df1db7ab73aea1de68c9c0ffc29a6375f485e8"

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
