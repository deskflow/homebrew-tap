cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.91"
  sha256 arm:   "088b92b0f9d17ab400ead13e7818a4e02566847a1a58c8046f84bff2c6153723", intel: "8be8ec75087d26d09b50b0c4063d68771dd840e3abb3343789ce3d95f631545c"

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
