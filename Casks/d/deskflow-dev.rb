cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.99"
  sha256 arm:   "be20a3f211861cc3be6515fcea78fccbd3178cae57d89f7a7206ef7f1cd2edac", intel: "11a319b772166bcef09e3663103a5136c4a77efbf53801710238d552a6a6c053"

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
