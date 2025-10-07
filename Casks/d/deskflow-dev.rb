cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.71"
  sha256 arm:   "be3d07a3b9deecfaf936618935a867c8968b58189801443787b923a913c92066", intel: "6506c261e2e9fcdf4ef993b2655f0268c9f088a8dedd5dcb7385637e2a96396e"

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
