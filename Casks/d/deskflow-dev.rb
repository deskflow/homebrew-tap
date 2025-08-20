cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.131"
  sha256 arm:   "9edd775542aba63e9ce4df3f145510792c0648d6b6cd1e239f0296d6a045fd49", intel: "9f13d2c66184e0f0ff75c9b6cda2d5ef5ff5f7eb690e7823d7e0b1d1d728d110"

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
