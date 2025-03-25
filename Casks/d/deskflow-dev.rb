cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.213"
  sha256 arm:   "95dc359b1ae9819bc6506544260da11b7cea9f2b706dfca5489a0ae5cacd28de", intel: "02de8f46082f35c865123e3f8ae56b6a3a306cf26817e036f2640aff0cbe498f"

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
