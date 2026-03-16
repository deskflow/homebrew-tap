cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.84"
  sha256 arm:   "e926ced016fca461f0bad23aee1b4b12c2fa03140a840007b0116ce39a16c68a", intel: "8f6f442c8b355cdfeb7e14a0d90bd2988cfd037a012c6e149fb6182e183b1c1c"

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
