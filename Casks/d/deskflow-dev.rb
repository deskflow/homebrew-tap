cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.362"
  sha256 arm:   "05f0db3c7821d58a82069cbac7b698d3f70395c95527c5c383181d4d6f220807", intel: "1d08f344c747b43be23ce5c1bdea68ae28310accc086816448d31b9de2042cc6"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
