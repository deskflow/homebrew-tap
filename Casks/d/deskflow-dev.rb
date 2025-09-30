cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.61"
  sha256 arm:   "cc271834766871567dd85b19f56c1b8185222eacd1d2bcb4f942c3bb53963712", intel: "f24dbd5b9ea13e74f023fa667210b1a0ddb55b489007317195230578fd06f0e7"

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
