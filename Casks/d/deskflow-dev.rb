cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.512"
  sha256 arm:   "fc0221d6787ab13aef614d710ee63b0af610873fc89dd1aa6b02bfd2d8af6ffe", intel: "62e6fed7c8764fd6e74ad70c8af3af5dac787be297050184bc5eac294c7919ff"

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
