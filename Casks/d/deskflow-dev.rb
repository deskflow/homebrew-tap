cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.109"
  sha256 arm:   "952cb7a8bbb0fcb1c8147604ead944160838be8915c981ca35ca526e45c84b86", intel: "03a173820dcb2673329ad1158a02249f180cfb12442e7bc39118bf72a4aa2bac"

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
