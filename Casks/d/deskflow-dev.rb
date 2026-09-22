cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.462"
  sha256 arm:   "4abc5f9ce90db012fe3b38c792009578388219a69718680e6f1088ef8c2fb6bb", intel: "6db803105ad04c592fd04d5c4aa5abae7b7c8b523222e0fd7759fc24fa2c6b16"

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
