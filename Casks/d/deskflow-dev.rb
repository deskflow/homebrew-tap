cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.187"
  sha256 arm:   "f28bd9fd284a273921439ce499a66223104ea76d889f75436dbfb431d71fb1a3", intel: "35bdc9ac76295371bf49f168c19f1e2708c13492b1611ba3cc52d9de55eb03e5"

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
