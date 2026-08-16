cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.393"
  sha256 arm:   "bf3fa8f59599272957d1787037bec31e600b6daaad24b1929c5cac9f17e3ddd0", intel: "6e5f5831a911b309c7c56de82061e7f418cc4dcc7675de3f7ff5148feadfddbb"

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
