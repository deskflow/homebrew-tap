cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.82"
  sha256 arm:   "07bc6bd28d5c607e106f92c461db2415b1d29306b8b1957e9708f6ca981330d9", intel: "a101df4c1fa35a39056d8a7d920ef6b25757c9c0d0b62224c4a4290c8d285183"

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
