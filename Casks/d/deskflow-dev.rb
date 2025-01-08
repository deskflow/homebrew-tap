cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.45"
  sha256 arm:   "41da1ae528d6ee02d47232841d3a19f461413bc133ba87669d35dc28c4ad7a74", intel: "20d827f0348b278176b5dd853908b79ea362a799d6f89990deb0710142692715"

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
