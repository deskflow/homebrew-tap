cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.96"
  sha256 arm:   "71ac6d438058b650895e03ca5855d8541504e348079595d62a5405910c996be5", intel: "473261cfd8d2fdaa88cf28ecd6fcc093d7c2b23234d10a18871516d2e2bcc73f"

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
