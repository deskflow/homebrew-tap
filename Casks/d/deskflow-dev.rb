cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.13"
  sha256 arm:   "0046938b208e003d2ad7cde7017071fe07c5e0096c583788ac07694ba412d2c0", intel: "aff8ccbd8fa9dbcbf9fd4b95d2fbfd8a0ebf787cff3ec92a4bac8c4cfbc732d3"

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
