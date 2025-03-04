cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.0.0"
  sha256 arm:   "d124cc23e4fde7073e1738c1dfc12ca808b6d64affb243b6bf6dc669f3aaf4fd", intel: "7df659d670707ea3ebf371085445f4014df7e91f35c05fd6ab6c5d7f5dec54cd"

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
