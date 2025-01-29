cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.165"
  sha256 arm:   "9cfd96bf0728c32da88bc064d4932dc3a292f09c1e808847dc7fd0ddd3400d27", intel: "e18ff21f49bcd5357bc4abc5194e6c7344df16105187153ba8f71366a8f2067f"

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
