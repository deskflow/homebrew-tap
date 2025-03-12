cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.20"
  sha256 arm:   "d4ef048687f76b24ab96b2dbffedea1e97e49a7b9e0dd286a93d15939b4bb6a0", intel: "c26592faafc1d8a34aa644440bc74c1235ec4eccd562253e72b044d5b5f079bd"

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
