cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.137"
  sha256 arm:   "9b3e31a9d3d9f6f1aa11df71e20bfdf192442f52b7480e899a74916ce3363f3a", intel: "59f0bf7c46b20b961e2040f33d24ee01caecc30bcefdddf5a7dbed48516cd96e"

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
