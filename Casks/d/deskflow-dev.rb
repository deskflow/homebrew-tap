cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.203"
  sha256 arm:   "c80a359cf7dcace15ce1f63a92e1bda51589118b7df62bca40a96ce226725cc7", intel: "a7851efda6040ac156463499f9abcabc10f3a07030296b84e4f64a2627c5bb7e"

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
