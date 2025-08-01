cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.33"
  sha256 arm:   "447da2723c8e7079f6261e52968987a37ad0f1b9ff2cd1eaac5221a7e34847cb", intel: "5aab23c19ec54c143bb788b23e64c4083e3bc9dd88f89b6a9782d3354a2e2965"

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
