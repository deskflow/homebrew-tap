cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.0.24"
  sha256 arm:   "ae4b4bc1d62c61254fc6570a03df1fc40066282e08ea09fd403ca4722467f3f9", intel: "19c260985824751dc786aa38cf1c9b567cd51675caba9ba6000f42172d1cdb09"

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
