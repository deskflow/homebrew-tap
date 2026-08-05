cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.350"
  sha256 arm:   "4372d99830457b1c97d257991343a781f1c2c80c862193f854c3035c1cec0c1e", intel: "ffa5d5bc54ee4041c5b14c8818a5a88f933f404c2fd0ba249cee43a5c93797ca"

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
