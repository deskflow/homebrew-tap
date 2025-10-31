cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.188"
  sha256 arm:   "c4d6b55ebfe3e4b5d2f4cfcc6c0c6613d6d99dea582d966441d9805936a30e1a", intel: "d9faa0616457cca1716e8013f2a42076b70ce6cd65db1647928ed21cdf9e6fbe"

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
