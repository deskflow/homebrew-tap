cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.202"
  sha256 arm:   "5911c3b922af0f721654746a9cc1de4e0fa0ba7917bcbba49e8076806a5b35e9", intel: "5689202c1e76ccc64bbd5b27b2be93478c5bb08141493f611b3bae6b5e0cc642"

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
