cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.219"
  sha256 arm:   "fa7d2bf07d3ec0bd4305b2a656c34dd9b092450cffd34e46921bc46693d0aecc", intel: "4f73fedeb0e58088fe726e07c15f3b9162bbd92b5e389caf28103144641cc840"

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
