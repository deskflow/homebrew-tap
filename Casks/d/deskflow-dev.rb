cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.61"
  sha256 arm:   "912f9377bbfe3087331511a3c2c6997989ed6b3b538d4fd76aa7a4c74f587a85", intel: "6c7a567b563abcae51a621697bbaca6f143fb913954400a137e886e8892aba41"

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
