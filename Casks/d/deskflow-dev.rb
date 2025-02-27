cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.98"
  sha256 arm:   "fb20a3901996a051e8d3eb1a2a503dad7962a05520d045d151a503ac81b47a35", intel: "086217dc889ed6d349448d052bb6da081c10b4ecd84783de11ad1062406bfe79"

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
