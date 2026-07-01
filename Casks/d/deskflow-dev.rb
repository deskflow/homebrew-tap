cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.296"
  sha256 arm:   "53db70ba763386d2847c1a66fffa837969ca10e895f37da20e5a37f35b65184c", intel: "f6045fdb33af2c6c1a767b09e387e75fd012aaae9ea143becb2a423fefe6f7a5"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
