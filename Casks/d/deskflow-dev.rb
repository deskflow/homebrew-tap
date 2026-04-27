cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.165"
  sha256 arm:   "1750bd74c71f611c9db648206bc999140fccd9d008ed38f70525ad1c9c8e8e3b", intel: "dea76125b3f4b7b248fa6727deeb22adc77b7e16cdc54587f908903714882743"

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
