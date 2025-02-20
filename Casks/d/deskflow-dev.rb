cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.69"
  sha256 arm:   "29459aee6144e345a60a31ecf6c0b1e9dc9633f7b674f482c1abf4c09c33115f", intel: "558c77e2904228f965cb5f6da5d52f1e6d3320f9ed06733b43be45cb43e53f10"

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
