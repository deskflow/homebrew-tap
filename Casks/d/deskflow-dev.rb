cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.294"
  sha256 arm:   "b88b90ab20aba71c2ed37a26e1b912c36b07950c9c2f1f936939f770c8f658f6", intel: "1c3199201b758426c80d9336cc65dc23db3cb2c0e80cc3461c3cce9b7fa0e625"

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
