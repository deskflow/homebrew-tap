cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.33"
  sha256 arm:   "8404a0461db10821c31dc80e552040fd28e659d38880f1ef62976427e2ada324", intel: "1cdd1642a4e9335a6560d35d875878338e08f902626621ff538daccabe0d63cd"

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
