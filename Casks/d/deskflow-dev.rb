cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.143"
  sha256 arm:   "3ecf98813f2e46de9f81f21cb4cb3ce5ba58dd7419b57fc335343db41acf01ff", intel: "8d915aea5c525b53282edade529b8276331ea82fe56f4dce5460b53e23db6fd2"

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
