cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.98"
  sha256 arm:   "af1a54f5570de5986aac331243f36422aab783839bb3fe8e508ae91fc90f3bcf", intel: "502c638bc1275351e539d70b839366e21a9fd0596ed2a67a42d5af7f645c3950"

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
