cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.120"
  sha256 arm:   "5a21604bccc84eb607b6cea78c5be3217c7042d4f3e53b3e10088c86aaf47ccc", intel: "bb161bcb822b64ff95c75d139aa3556117e5dbe462535f87b07146b15dfd2069"

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
