cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.242"
  sha256 arm:   "3b478d87fa56f508beb50f47bc2921acbe119195df6d1406dcda39fb58942f7a", intel: "07c66fde4d115941b4128dd296e5fbc2f4733ca0d4270d9d2888f4b66215a477"

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
