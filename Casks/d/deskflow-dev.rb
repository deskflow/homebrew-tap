cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.168"
  sha256 arm:   "44ed32b7ebff74e84fc8e58b6a15a14fbefe814a12af1fcc53e936d09a234765", intel: "d40e81e1f545e440d94c005a64c248a18a9e595a4ebd116cd4652ddfca5ee2b0"

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
