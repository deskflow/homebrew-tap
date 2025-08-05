cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.44"
  sha256 arm:   "10fc39e0de28fc86241b5d9239a86c03af289abd48416df488be1edf76e73235", intel: "ea85a63e30646a1aa76b01a022cf868f7bf6e50a6eebdba45b8164994ebc8229"

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
