cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.139"
  sha256 arm:   "b1cd12cb61eee4eddfedff190beae0203afa01e28dbbc6293ad79647876c3a98", intel: "c6ecd7c58a3108ee7d30a788aad24f83dd08d8eb9fecf5cef92c7e58d5ae9664"

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
