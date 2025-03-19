cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.122"
  sha256 arm:   "9e09b359c22495c143611220702bd765033574187d03d68f2d33e3418fe74372", intel: "0029373cfd8323a15de6e9380a9caa246440acb5dd6b171c1a83d01414c7731f"

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
