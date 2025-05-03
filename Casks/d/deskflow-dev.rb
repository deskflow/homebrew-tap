cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.166"
  sha256 arm:   "92541a270179486d45665e62f1e35f26770daf39dd1bb01ea0c0b925e29f276f", intel: "54ae7fa8ad44f1c5aa57773928238b34cfab72123791e9be698ceb2686bfd9aa"

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
