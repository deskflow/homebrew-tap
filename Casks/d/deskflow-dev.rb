cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.146"
  sha256 arm:   "602f1ba4a5c6c060a200bcb70cc9df71a9d9643f14f7a420b76f01aaf721b589", intel: "17dbdbf3198b5bbd270ac8c2a78a36d6f24883a27cfd2243444f0cc88182e136"

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
