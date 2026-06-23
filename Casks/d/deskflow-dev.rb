cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.291"
  sha256 arm:   "ebff0def4814332d1222f7f6875500ac48ae4aa4e664edefe5f5b546164f394f", intel: "80c9d5b02dabcad4daeb546060338d7ee243bc115fc393632c8685f967f6bfb5"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
