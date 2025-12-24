cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.102"
  sha256 arm:   "71beab1c1292d094e6998979372937d7fda1f9f05921f906de63461fae19ed32", intel: "7765015227fa522279fc408ed1b99f697a99d0a69c5118a32c8247db6603dc7f"

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
