cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.150"
  sha256 arm:   "32c7ced2ca972397ecfd0b56e43757624b2f532f82629313d18aea71a61ce5df", intel: "781a38125e19af33b166d9ffe465c0ae1358fda847bcaf5d49a930e89300fc34"

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
