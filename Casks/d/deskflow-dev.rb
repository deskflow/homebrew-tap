cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.137"
  sha256 arm:   "87a507f9ac4a210a31114b646081d3bcf291249cb5e9c737e6a7130d164bf328", intel: "697a6844a8e1e6c092bb934c24437f63ae5c5cc136ef700b36a9d116349335fe"

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
