cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.80"
  sha256 arm:   "8f15d21995fa065e5180bfb0887a736391f3ccc5fe979461bf573966e9eb148d", intel: "8f407deff4fd863b472fb5f23d4a7b0aded511a2bfe2e2e5074c9bbff6bc2db8"

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
