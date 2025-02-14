cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.39"
  sha256 arm:   "2d96b814cba198ee807380947d83f030a7ecbbf37ea8acea2b802ffd576a0fd1", intel: "24a4e19f3717c4ada85f664deb000b1efc1e0c4af682aee7b09e242d9c403c8e"

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
