cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.375"
  sha256 arm:   "5afdcba1a451781d3261b1f1a1cf399bdcae7735dbb1d5cf74d1d761aac39687", intel: "afbf37e832ac2647998ca3e286cf4f417fa2af92b539b4e90b0aed19e9c385b2"

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
