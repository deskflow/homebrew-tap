cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.27.0.22"
  sha256 arm:   "be0bae5415300c425721d1d591b65e2586b0724766080039a92089999455bc53", intel: "576be47d17b47e5a327528216bfd433e44f842e7e15d8b1fd6aaa44af6606342"

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
