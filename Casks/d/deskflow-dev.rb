cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.51"
  sha256 arm:   "f307174db5ccc929328340eaaab879424361417213d8c0e7cb7fc8e02f400896", intel: "e6d84c505d92fab549147ad4712cfe183658d1ac3d21f76c71264244c844e21c"

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
