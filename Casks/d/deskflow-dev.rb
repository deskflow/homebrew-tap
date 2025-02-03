cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.7"
  sha256 arm:   "5ad194e9cceb67f7b60cff48a9ac0753bd6e560e52913699da5442c1dc7c8025", intel: "2e78ae2c8e00c7174bb5af7b33bfe9c086084b6aaec4ed7703ccdcd199537ca6"

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
