cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.9"
  sha256 arm:   "b4b6813700222b286401b2ba75ff15e62ff2c597ad59dbacf9d8efef8cdd8750", intel: "203689b38e3b4ad3dc6b605584a2acbba0b7af3567e86157e84d5d1616e8479d"

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
