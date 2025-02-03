cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.8"
  sha256 arm:   "9953b165fe138991b2cef822d62f793e9c19c97e7c86d0201cecd8a76fed32ae", intel: "c6d3dae88f5749bfc6c70a870c61cc003167d5034bee74279db3125b1c0ee901"

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
