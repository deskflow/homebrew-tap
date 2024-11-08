cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.1"
  sha256 arm:   "11c243989d322b3b4b53a086fb89ccbcd64540f82fd3ea95ee600802999a13e3",
         intel: "079d047d1660931f2f6e7f151c58650e601a6cfab5f3d3bb3948ec2b09ffe728"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
