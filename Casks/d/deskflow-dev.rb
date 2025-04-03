cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.1.12"
  sha256 arm:   "8d566eb0218be5dc8f589dd62912d40149e630911b572a2d6b7d2fbc00e3ef22", intel: "f0057ff793d280b8ba6f981e0d2e8cc1227323f03eb68cfec98a39a84bb18d63"

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
