cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.216"
  sha256 arm:   "f84f35f4899ca3d513073df439b3871381ef7c3747084937759924f02ba8c55c", intel: "d158e13e8623a4f4e256d241f1697c5f2c9cf6e7514bb342f992e1b0873341a1"

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
