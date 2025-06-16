cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.65"
  sha256 arm:   "5366f5292dfeba41900cd61535b9cb7cad0126e6b5e2ad71cb7df0c9216f9115", intel: "68b280b64244ecffc05bfa439ec4b3b27fb7ece6072c955533185df55ef02e2c"

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
