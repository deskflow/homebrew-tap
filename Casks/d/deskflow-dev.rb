cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.54"
  sha256 arm:   "fe03d203affa34dc5477bebb8fa8690070c2ddde6497b9360bbbeb4e4d509a4d", intel: "eadb75128df73730c0083cb3e2a2e78da9213e20bc97e823b2f1889dbea4c1f5"

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
