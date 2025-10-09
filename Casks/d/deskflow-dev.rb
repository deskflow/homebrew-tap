cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.74"
  sha256 arm:   "640b27003c74f07f6eee6c7a4724a7da3b785ec1a9744715854021f75474789b", intel: "85849e4ad83955c13967267b4ee58081767fa901083652ad36ff64c8ba6c231c"

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
