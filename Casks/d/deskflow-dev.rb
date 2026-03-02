cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.66"
  sha256 arm:   "7c44d74a00af4e026b67e43a73ff4c8d2404e60d824f39f3261baa497ebcc8ca", intel: "6c1136f8a5318cf34ab922d4434d5f9cca1ac7a1ff3a2e3911a9948ec64ce06f"

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
