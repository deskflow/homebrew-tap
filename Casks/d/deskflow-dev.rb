cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.207"
  sha256 arm:   "c29cdbb4683b6dd70deceb7f2e3ce949e88ef3f9eddbcf0d01745b1db5a1bfb8", intel: "ac7b148e0c509e0e2e12bc5dcab3479fd591c0ec934d0863133090b2914b79ba"

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
