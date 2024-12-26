cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.97"
  sha256 arm:   "00e48a98b1435e2da92d8044e90c01b55818df51b11a40d90869e8e5b6b914a0", intel: "8e8bb9e4ed94c6683e01e95e2c26d844e41306846aeda1ec1849f30066876956"

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
