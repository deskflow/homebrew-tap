cask "deskflow-dev" do
  arch arm: "arm64", intel: "x64"

  version "1.17.0.169"
  sha256 arm:   "a837c1a02467d47179fa4c8856cc2b952eb36836abda8888011ff75f42bbd1c0",
         intel: "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-#{version}_mac_#{arch}.dmg",
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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
