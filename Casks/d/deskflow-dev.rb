cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.131"
  sha256 arm:   "40c3bd6ab34d416dfbbe42d89c9f2a1c351c359e36f3fbc801fffb8f61c2c869", intel: "853f8f5ffbd5fd3b97d596dd72f3d1e68dd85286afb5a162773909b6fe61dca4"

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
