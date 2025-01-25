cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.151"
  sha256 arm:   "4d77f81d479b5f625c53c941937f83d27ffb378b69e306a2638ae6bfb66bfed5", intel: "186c68329ae4fbbb80e0892163b87a2ffd8c8951503b3cceb8f28f45f2a1b7af"

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
