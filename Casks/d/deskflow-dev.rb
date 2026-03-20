cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.91"
  sha256 arm:   "a6dd0968ba18152684f2ddef5507cf915f3f82a7baaf08a92f01f934ee01a23a", intel: "87d068802ba1f48bfd0aebb08d9e43661b09babe7f5c9e945e843d5c58668e3f"

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
