cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.146"
  sha256 arm:   "f2ef27354ad62ffa3debe41c711ef1217dcbfb2a10e850de93443d542615170f", intel: "c0b6027e9a180396d115e50f09a0e7b91fd9e3552fab8283c216f48cf1f937d7"

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
