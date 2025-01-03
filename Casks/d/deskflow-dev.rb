cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.8"
  sha256 arm:   "0cf5b226cdcf5f4881ac16d9a6341e260edd4d2cce2093feb1fd8a1e683ef154", intel: "35cb37a660ef162295d498b2c00e00a767a669e8ef50544af68353a55c16ba0d"

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
