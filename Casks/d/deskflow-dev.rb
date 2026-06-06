cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.226"
  sha256 arm:   "20f42eee7744d2105c70841d0cf88dbe2fff46d493bf168f1a24bc5abca11c2c", intel: "7ec2197e23471eab69ed33cf70fc2c9eebe5348fa802c8fc8dba5c68c30dcc7a"

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
