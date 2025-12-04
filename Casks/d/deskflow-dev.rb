cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.66"
  sha256 arm:   "0288f4550a5b7247b859e5f72af44f5f0e4a5320185e439a5e0555edbb7084f1", intel: "5ff3c1d7cef92f1abf60b975bb2e340cc491f0be577f92bde10858e7f84ca82a"

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
