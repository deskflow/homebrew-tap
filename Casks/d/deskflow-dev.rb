cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.84"
  sha256 arm:   "a48a8383d13bb4c786c1ee51d6fe48f023bb379143d38d7ac61667c6bde41f65", intel: "b935580ce7e002f70770ff9d6c7586f20ca34c0f0ea677cf753351a8cbff7f54"

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
