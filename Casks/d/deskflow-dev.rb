cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.111"
  sha256 arm:   "35bcc2d97da9263aa200c7b6dc90b1642d440ae38ea27aa5e72679f549a85dbc", intel: "2566d7608f6c5f7bff3258e39965ba6723dea3b8358253eb3387b7264885dc76"

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
