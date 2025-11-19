cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.369"
  sha256 arm:   "baf6eea18c703479ada1c3d6f0c8fba7314436fb0de890718c5fa3e200f7553f", intel: "213cdc94341bb65ac88f3eb63fd3d9b934173245a4a597ddf31552bfc2c40645"

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
