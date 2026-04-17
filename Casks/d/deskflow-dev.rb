cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.140"
  sha256 arm:   "0a068a8bf0d51308c6275013ece354d28d2b2ea2450ee1baaa8d8dfdad2b14b8", intel: "6b9dad0e27021a5b4a1c5488d8e6116cb25e678ed7153b178e80352f08170e66"

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
