cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.7"
  sha256 arm:   "40bce56bbd87ac23380a5a55b20b41db010c132f3ffd461d3a9aa957e76f7a9e", intel: "22a24ec127f9474c43c0375107e76ed46d7c6893f92303a610f5645e5c8c202e"

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
