cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.154"
  sha256 arm:   "6fe99405d1a69394b956c5b24ef8a9a0af874e8b3569e0130e13a48d45fc37ca", intel: "15815a6437aa38782e42af36206d1c810ef54f6eb7299124b9611bddd4add495"

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
