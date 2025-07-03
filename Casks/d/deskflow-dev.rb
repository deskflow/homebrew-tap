cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.120"
  sha256 arm:   "353fbd316880f05548dce5b21ff5aed384d43fa8d1d4e3aa6b15c3ebc81256cc", intel: "43f43d706d9f96d2859309a8134df9c945db4a344595b13c60b59a62504234c1"

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
