cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.34"
  sha256 arm:   "29a4b0b8bf6f41f25fa08d09e12b1027445c7b708fd55df558359db44dea929d", intel: "48b7d908c4374be4a6670d9fbe4f7a97295d12dad1987adcdfe7aae3d2f7b925"

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
