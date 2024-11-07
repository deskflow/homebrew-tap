cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.0.185"
  sha256 arm:   "fb60cb47535dfca36d75df41b9dd1e0dfba25e3f854b5e6d0615da8f0ff3ba91", intel: "9bbbbf1a36e5a0deec2f13efcb94774ca42efaf234fbd61f550c81323366884f"

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
