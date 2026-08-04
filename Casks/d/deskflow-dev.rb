cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.347"
  sha256 arm:   "b30af44a99a3e1e2c09f8e8922edb7a194df27a77c6d6ca9aa4e247a68327bae", intel: "4d230438eff03e4fc7ff05f1f04b9421031e580c57ee70960616336655d133d1"

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
