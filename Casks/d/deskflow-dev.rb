cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.1.32"
  sha256 arm:   "9b936e979476593b128046f431863beed7b60442a2e8d17b4746c4ef5cc5c4bd", intel: "8491c6315869c366acfd76aa533d927c54da38e958897d962c9f99266ac6d1b6"

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
