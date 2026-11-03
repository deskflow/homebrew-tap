cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.23"
  sha256 arm:   "73d158787c9ac5fb0b9e8fd8e6b9422f896839da4631c44717e1373f4085fa64", intel: "02b97fcf354c71ee68faee211ff39bc0b1cf219c8650bcc00efa7d6d0982c526"

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
