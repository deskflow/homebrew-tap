cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.170"
  sha256 arm:   "d1147f5c20929306f40a318453f2a3519a7810890d4d8256446c699447169d49", intel: "480aefa811f41c160b026dc3e8f879de4518a35ed877d3e15c1817251d409500"

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
