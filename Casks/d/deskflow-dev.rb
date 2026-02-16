cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.0"
  sha256 arm:   "d7a155371b870c765d4fd1ae7708823dcf2306c252644f98024e81bdd05ea0ef", intel: "554702bc7faec854e5a57bdecd17c2b9d167768898392a10673931b6cbfc1958"

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
