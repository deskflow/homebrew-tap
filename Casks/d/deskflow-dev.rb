cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.90"
  sha256 arm:   "a44aa28796078481d15ff6a558bb5c348b40c24c25fb97d6cded9de230806ac6", intel: "f5aba67e8bea8ef0b047fb5d74e730edc20f433f1b13ba3336c3821c3c38db24"

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
