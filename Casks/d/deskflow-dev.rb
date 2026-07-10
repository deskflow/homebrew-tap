cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.307"
  sha256 arm:   "99cc97b7444bbc09857c1d4b2a9169e4d8c1c93bbf1dc0d9cd5357d0ba10f2dc", intel: "b3b63db2ce63627685aaf84cf5163a54d3bd56be08aa59326b95a3427bbfd79d"

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
