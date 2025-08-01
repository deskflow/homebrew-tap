cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.20"
  sha256 arm:   "8085167932dd7a55d5d689f90cff2ee5c7cf14cd619520cb16130f60e8b84b59", intel: "3014443f32a308ce06e7b6e6a311a88f1fa4d15482fa713fd60caec85c26c2e7"

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
