cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.58"
  sha256 arm:   "c1a4141fa15009955005b51e0704351fcd36eab92218f56ae5f1977ba7fb61af", intel: "2c249eae8090e811d0d640adecdc27d15d9a59ffded42ebc45e6e6505fee62b8"

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
