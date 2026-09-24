cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.469"
  sha256 arm:   "dcf589218a89eaecbf2c2e1a6b6c73fdab66e222d0cfd793db114fb3ffc37d84", intel: "996ed2e7fd65fb4df033d47e9becebbe90362557d4ed16b9a2232710d165222b"

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
