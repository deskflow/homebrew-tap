cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.295"
  sha256 arm:   "e7dce6c57e7c351918c16133d76ae83027395bca1cbdfd86b4666a8c408433b4", intel: "e23404e3b929a4bccb196ecbcf96649856860a81edc4c71646552a90a14b9832"

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
