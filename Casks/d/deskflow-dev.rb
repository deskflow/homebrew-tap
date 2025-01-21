cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.135"
  sha256 arm:   "e4d190508904c740ed18ccdb14799ac6f0dbe9ef76ada0122ec2b788ad97a12d", intel: "cfab32004758427b8768e419864726a82e33cc0e836b2cb92a083a296e877e9e"

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
