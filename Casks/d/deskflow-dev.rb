cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.165"
  sha256 arm:   "9ae47ca70d52a9f9a3206daf2d4e7143f9de3fdc5a8dad6086bc170a6da40ede", intel: "37cca3d3d70389117074c4e0b6704399961f68c7e050d1968e861d6609204140"

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
