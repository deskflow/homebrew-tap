cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.204"
  sha256 arm:   "c9c949bd8a8bb64ce155c6c62648d43a05f9994efe4fbde2a6b40658e7442385", intel: "1f06b8210aa17726c03c62a8731eaf7f0273bf74520c628aedcde452a86288be"

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
