cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.19"
  sha256 arm:   "61e66d39848503bb491f8eed5a9996f63345b48952fbb334f6a3525999c8beb8", intel: "2902b511ac0a5d4e1777c70458e82e4ddf4814915ae080f654c9cbb11db7e205"

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
