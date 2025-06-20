cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.93"
  sha256 arm:   "c4a5e73a5b99e7f3f7c7bfe36e7cb55b96a617df5ac0dd31857ca688bd0caea8", intel: "0328837d9fe3489fe820ef5c32fca118ddc263bdd364e40e6ba34f06fc5ef5a2"

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
