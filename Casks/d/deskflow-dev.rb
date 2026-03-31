cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.105"
  sha256 arm:   "1efd33ac3a6d670c5efc54366e5c19885c3c70e1007af449c7532b8e44bdc521", intel: "82ad339db66c1ee8ede5d2618cb0fd8d27dbd61b32a7a0d5b3ec70c7abb69b1c"

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
