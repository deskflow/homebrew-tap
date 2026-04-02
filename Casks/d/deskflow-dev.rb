cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.106"
  sha256 arm:   "3efa65f6aef02a681a604aaea0470c1ecf49bcdc23d1f9960e7dd156767df38e", intel: "343e021bf5124b70c1fbf4a8d5d31d61eb27214a759d0b8d6c26f22df7baf87e"

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
