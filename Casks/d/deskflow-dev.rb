cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.234"
  sha256 arm:   "d97843c1a8430e99e7af7aa626fec6b94a3bd24dc5083aa1346246bd7774b63d", intel: "6962df007ec6ce99e5d4c9b8856bbb89fe3a4e8085a8b77bff041e6e8856238e"

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
