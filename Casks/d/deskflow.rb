cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0"
  sha256 arm:   "20e96dc944c1bea84ae2e7c398f97bb9830748f1f16b39206e07d7d31ea0ec54", intel: "cea6eb73b14d67b74f94bbcb9321df5c2ac3f211bb42c01aa50b481e7ae5fc52"

  url "https://github.com/deskflow/deskflow/releases/download/v#{version}/deskflow-#{version}-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow-dev"

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
