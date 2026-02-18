cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.12"
  sha256 arm:   "7cb04ccb22484259fd5421e84da2ae8782e715dd0678c54914146b1e2bed0eb3", intel: "5e557a564a37fa6c9d8c07f4d0cc12deef890ec4f7d790b37dd72cb5ad780e81"

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
