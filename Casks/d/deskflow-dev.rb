cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.2"
  sha256 arm:   "18afaa60a10abf55fd45a28c6b92bbc4f931b8a70f435785a5cd590d45938f7a", intel: "0353a88533c8fa88ade0c5032d603ce059e1e3697b06d7898d8c50bfff007915"

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
