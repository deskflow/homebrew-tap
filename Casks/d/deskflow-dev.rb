cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.25"
  sha256 arm:   "56cd515f58656a31083fd01edc4fb7abb781e49edffc46bd019c5cd533ddecf2", intel: "2974a368a9c81409cb1275d22220e435cdc531d0ff8d38cdb14db2a8091622fb"

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
