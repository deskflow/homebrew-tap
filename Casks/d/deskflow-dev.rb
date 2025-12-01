cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.43"
  sha256 arm:   "0a06f30fb40c07609ec8cd7f066861a15c8dc138cdea9082261f5d9df0fc50b5", intel: "ec6c65df00749c25e802b1c420e6d83d151a192644229ff72f3357bfdceb5bd1"

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
