cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.104"
  sha256 arm:   "0e8705c736ec3eec9e06e5e70995581ab942da1974a0b5291db36c7ca2eb3876", intel: "739710ba323cde780721b8a401cce65c38021b958e2a20919862f2d83486dfc1"

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
