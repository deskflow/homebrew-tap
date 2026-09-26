cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.473"
  sha256 arm:   "465c38fac4f6bd4fc8574a0d6ba1a4a0475d996c489a8f4cab12461e6ddd77d0", intel: "1920c12480ccefb2c14b3c8225d194726b003db24d4931ae1e02a4013ecd34c3"

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
