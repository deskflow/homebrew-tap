cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.405"
  sha256 arm:   "0e4a69f4a994be76d902dd78551d110d0425c77165d1c0758e1c43bd9bcde134", intel: "49a3375abaef704abe9f0ce4181b66ed3c9786aaf26e04342339cc527e2d7d1a"

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
