cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.57"
  sha256 arm:   "769c0876ba6f269967073b933d8f652e4f059733648b75c2a9d9783f02cace1a", intel: "0d909f76316828e55e7f443cf39c2276f8c564a5c62b9285a28d472c4fa8c2df"

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
