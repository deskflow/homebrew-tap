cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.23"
  sha256 arm:   "34f5f55d42d2b54838657b18d7fbf56b0e8e0f74ea797d3c7874821e0a9d29d6", intel: "66704d6e9d2ca5a426866a6eb0657554f93e831e37ce14a5d5b65fb28594fe36"

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
