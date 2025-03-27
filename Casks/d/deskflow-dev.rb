cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.227"
  sha256 arm:   "1dd42f25b174b95a6466c72f208d34a097d9566b10cbc7a5e9d242e6c6407afb", intel: "7020362681c9decb9b11bc2ca2d35f31a64df28be7797ea28ea8a96df22b488f"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

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
