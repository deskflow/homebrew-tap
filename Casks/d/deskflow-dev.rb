cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.286"
  sha256 arm:   "dcf70fd38e0f39c37e7b2d64786b60c4d0b7972927c9dff0d80313938e0aef7e", intel: "a0df5c0d363f11417766d4ace67f3faa66388585aab47ad85e0a04942e243044"

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
