cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.118"
  sha256 arm:   "1f437b7a5665cabfe4e731f1161345ee6e870699da384440bedb91aa21c66a7c", intel: "67f728fab7f230a74657d2fd7b64a3028b4be2293534726f4772ed59b7e9d242"

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
