cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.215"
  sha256 arm:   "58bfbd977b3cefe177df383fbcb3e8ea3827c679691ed0e7a8536ddfc004dd35", intel: "0476753df2e0a02e9b69333d8d4ff1c9747d98d6373bfaede7d1f1bb98998752"

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
