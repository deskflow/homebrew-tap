cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.206"
  sha256 arm:   "1843d71a6ec4f491e62b6e4d152efa371784ca4ce681ce418d40b776c50c2c45", intel: "9a9a93e0a51a34e3e765dda5dd89f3ea920e5c772b79a7f9da45362b39a8fda0"

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
