cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.20"
  sha256 arm:   "6a1509c4f0859a6d0a93dcb1f1480b1834b8d53294f82cb031bbdb3b4f1eea1b", intel: "0b325efa4a895314350d706a39f1eff3208d385c1f53206e380d8f32f42582b1"

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
