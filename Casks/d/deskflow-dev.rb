cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.4"
  sha256 arm:   "48ae984cc748e33b2aa3f230c36939163ddc4c55d66a2d82d6c0acf08ffb0c8a", intel: "8fb990a91b31b92df7803c1e9381f51fb2a6c93fbe6c1de6bd8a5ea04820eab4"

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
