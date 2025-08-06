cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.64"
  sha256 arm:   "3dfbb514590370453bf3739bfe2f6256cd00701b538381b89da832b11ed869fc", intel: "3eef73fda81d39e359bb0f3ff776fab57f5a24dd01e2ed6b589b4ba7b88d69ec"

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
