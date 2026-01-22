cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.188"
  sha256 arm:   "3f68823a25f4f03a28ccc9353c8338edb6656f1bd0f6679a15f79dd9f586453f", intel: "3f49e815f544de37e3780eb52c31d99f32e9b9c25ab13e65d3c2e32f4b20fb78"

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
