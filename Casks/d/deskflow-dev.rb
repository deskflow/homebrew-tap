cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.25"
  sha256 arm:   "f8ca7c3a0038552b64d850483b86b30d4111e6d4d0ef0eafe7392cdba30995d9", intel: "a73880ddcb101eb990e4838e576f7d5896042445307f88c224ff3a97f5c9ee31"

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
