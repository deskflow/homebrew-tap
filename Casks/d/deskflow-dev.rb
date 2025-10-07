cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.64"
  sha256 arm:   "16e58845606fe11479eb9fccac018a070e150f9e6830f53508674dc25930643a", intel: "2d837cafcd2ae8994134ba4d3e0a1bc4190eea52a0ab898076f615b81e84c13c"

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
