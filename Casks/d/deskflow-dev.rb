cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.197"
  sha256 arm:   "03e41b0a41aacc6182629901bb992e1738e97a39d0a4ab9efd6418cee7347e5a", intel: "670cc5b18c9685288b7fb967d870be4d8c7c328a9d1667b7a7e1d1409002a4af"

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
