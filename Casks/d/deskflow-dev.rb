cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.9"
  sha256 arm:   "fd6b8cd4b3a76c548bf7e6977a2562f62b48df79e123d6c1e02bca805edf285b", intel: "f298898296ba6c19b1ef9675849ffa9c5ba2cc8ff501b5c1bf14f16e507762ff"

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
