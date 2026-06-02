cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.216"
  sha256 arm:   "735cc9fd13b8dffa0c2a4fe303e586a3e03237772d1bd073b9f6515125814744", intel: "6f4ea21eda815b2d686d82bda1ddfc3e572788b272cc949ed70e095b5995e489"

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
