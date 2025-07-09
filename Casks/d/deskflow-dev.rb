cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.153"
  sha256 arm:   "2ff614c43628c5afdfb6b7a6e571e503f5f16d32348485b9804cc0f24f00ab5a", intel: "57006fa9537793600b1256a740233f4f6b628ab3d3be341f76da190b37c06781"

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
