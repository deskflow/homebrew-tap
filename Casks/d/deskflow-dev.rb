cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.181"
  sha256 arm:   "521dfc6276fa137d0475f3d05fe81aac740eb975d3ea71deb8e85022518d7a36", intel: "4c7151ad1f14b211952e37d29a9be5bc2805d7c7b9458443e99f1036d1389bdd"

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
