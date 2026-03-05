cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.68"
  sha256 arm:   "17ade4fe29d23d1a8214e6316feca456c6b89d5b3746cd9b5782238f3935f920", intel: "9d1c6cc9e652bebc70133c6d8ced686b72356fa3e46ff7689bf13fc5a3995800"

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
