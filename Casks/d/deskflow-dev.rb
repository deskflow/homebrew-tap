cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.1.26"
  sha256 arm:   "652313bbe408a97a29e2896065e418e86517c0b7af624c41c77149ed9efd4a0e", intel: "6449daffd90194d78bf8d847f9fc03c57c59183117ec98d422f62a42835d8ffb"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
