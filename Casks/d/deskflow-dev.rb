cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.228"
  sha256 arm:   "aa75660e5b33666270b5e4b837820062d9047ea27de893f4eed4e08a9651d73e", intel: "fbccea2fb3cabc2f6f1a750d7534b1b13b540bb8734cf1fea441822e9e7d1f50"

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
