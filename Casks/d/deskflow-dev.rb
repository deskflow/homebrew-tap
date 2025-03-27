cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.0.0"
  sha256 arm:   "9e05fb0b0b93ad1615f25f8b3ef40a8074c1935672e746c32a1e4540ae5f0cec", intel: "2156d84ed43350c115d8ba16df6762e029a5e0a8514f14e86a4a117ebd72f7dd"

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
