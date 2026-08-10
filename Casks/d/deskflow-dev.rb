cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.376"
  sha256 arm:   "b7b185a6445a1aed66b2dc454295c84198ffc7c0d837a4a728cad8eba8fd1830", intel: "09c3fdcbe510b047b1195d12bc54c08929826c5291e649ecd15e9b7e5c9d1fb5"

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
