cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.241"
  sha256 arm:   "fc056ae71a2845ffb2fc60e3e40217caedab6e5fe1e266dcfe7d58265565a885", intel: "297b82e25afdad1e8b89618286617e139628350b5e1518145ea17b9dff9a6ca5"

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
