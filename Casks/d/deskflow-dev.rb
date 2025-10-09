cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.75"
  sha256 arm:   "20343062500bdf9980f7ff7286f04e0bb6ec66b4e79b105b36d36b3379c969b6", intel: "457a78aa9dfa4e2681795c753da8e3b614c56ff40c9e8d4eda4cfeef3640faad"

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
