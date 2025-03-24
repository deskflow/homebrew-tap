cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.194"
  sha256 arm:   "bcd71319ce76eb756ef496ed100b788db3ece5ad5bb0cadee5d52adfa384f19f", intel: "132dfc6cb53a892df2a59cf40598d643e72128162cef3a77b6f3243382602f31"

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
