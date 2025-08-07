cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.72"
  sha256 arm:   "4025059a0783855d2e0fc743d80aaccc2d484dc719bf31b0b8a8f9837f74489a", intel: "0b0503e5ea0e4a57238177ec568289e2f4a49670a49bf923aa9df134f88d8fd2"

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
