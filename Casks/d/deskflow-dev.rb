cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.0.189"
  sha256 arm:   "e45f27fac4794cf9f5180d948153d7c0ae6a384240bfc8cf5291f5786903957c", intel: "e8624c1544c3e8dcd5b88573938b15b62ab3c10c08772eae1766b4ca0422b535"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
