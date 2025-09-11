cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0"
  sha256 arm:   "c3e13796750d7236139aee10f103c5ff9e04149839c575b583af1666c465d76c", intel: "e4e9bca7597d0dbfe4144a409aa3056c568d04c55a9f3d1aa66a5286f00aa833"

  url "https://github.com/deskflow/deskflow/releases/download/v#{version}/deskflow-#{version}-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow-dev"

  depends_on macos: ">= :monterey"

  app "Deskflow.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
