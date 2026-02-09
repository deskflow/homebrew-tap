cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.232"
  sha256 arm:   "19568d8f9a0a21bbca37e87f71fa89b6ac03a2266b0d4ef2a95a596f194b5cd5", intel: "96717148c2578295afd187c1f1cd6c962d200ac1a00288acea87a25201485e38"

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
