cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.227"
  sha256 arm:   "b487f7d788e28ae5332ff84b821ca250c7539ddf4335c28d4b4b9353b3247992", intel: "eaceca41cbe661f357b93617a3a4f26e70b424ccee3249f4eb2bf92354b3da8e"

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
