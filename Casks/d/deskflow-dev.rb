cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.153"
  sha256 arm:   "0f210c7504882f7dead9cde24fc78abe0f6e7bbc19fc7c029c6329e1f3a4d002", intel: "9398fb64abaf4248b4b1cda65ca36b914ee303a5664c0cc5a2f20c5598f74f4c"

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
