cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.11"
  sha256 arm:   "de6b7476a56f4a5c883753699c034d06f3c060aec90e91b9ab83dcc142a68d9e", intel: "e7734bd66e6297f40020724184b5edbc939e02d6bfcf5ac408d68c7fa9dad916"

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
