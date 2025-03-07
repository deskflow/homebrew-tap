cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1"
  sha256 arm:   "4ca57c6937a8bdc8a09862aac03067cb6fd0ef90356057de69a7a1ebafe7f8e4", intel: "be2b6fe7db2e0f2a37164e08f45a57fc228299c2571d3b91875288d690f33c47"

  url "https://github.com/deskflow/deskflow/releases/download/v#{version}/deskflow-#{version}-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow-dev"

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
