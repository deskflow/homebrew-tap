cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.474"
  sha256 arm:   "7d53ca344045b33421ce5fac7690f16c0894281242bb820f1e3cec6fece99fc1", intel: "def42718351e491e829b5137fa884a2e4085a99392a74acdc1deb43a6965467c"

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
