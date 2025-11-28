cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.32"
  sha256 arm:   "59997ee741285d9a02ff53720076e58d8bdd882b366a3cbacd2cc64c03757e9d", intel: "25d046cb87980508b7bafe39519586102a45a80350ae1d04710c7b4b2caec3e9"

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
