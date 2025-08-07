cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.74"
  sha256 arm:   "b68556c81971724aec4cfeb627eaf8cbfb51a852275f18f22285f5979fc4a47b", intel: "7af10aaaa60ec991f6a2eb60db0e6187337b227b7f4b4b1c1551aeee4a5a64b8"

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
