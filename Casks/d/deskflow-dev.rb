cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.97"
  sha256 arm:   "354ed0236163a4cafa395e8baae962c5d6a49d7593f6b5389d2b71986ae0a7b7", intel: "2f1c79bc315d90153848af5c236f805f06f0574aaa9f3f493ede4a185f9a5bac"

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
