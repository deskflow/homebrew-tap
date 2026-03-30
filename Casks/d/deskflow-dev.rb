cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.99"
  sha256 arm:   "2fa9cac813776d4038377026afe61d1e1f684d2081bf6a8e93ba85e8a39b1593", intel: "09aa69b6ac54d6e5bc8765a4efba0435571dbfc55c07963f369683e0e6344896"

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
