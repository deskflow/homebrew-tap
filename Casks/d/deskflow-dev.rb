cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.394"
  sha256 arm:   "6af45b1b0e435772c0015f69f9af1a2c67096b0af2b5145b1f3723abe32fd285", intel: "663154b43429fbc6a857b9dd8732cb5b4d6fe23ad4a7a61e52d0d8eee683ebcc"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
