cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.242"
  sha256 arm:   "12d6fc3e0d9df285adc3631dcdd4f42b69cb38d85455186a7e992ad7bbb308d7", intel: "777dbe4e3f4fea7ca935d72b2e1bba8cb8a99748b3627dc6074a604d842f4576"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
