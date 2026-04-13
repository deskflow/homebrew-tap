cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.137"
  sha256 arm:   "db29723d8b92411d0f30f254759eeeb6057496d9384d928a026bbf45996768d2", intel: "41598a850f8844ed67c5984f4399e4fdbcf9d63cecd057d44151f3e8ad28be6e"

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
