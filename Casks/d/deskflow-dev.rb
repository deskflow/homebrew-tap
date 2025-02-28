cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.116"
  sha256 arm:   "0552191e08ee4d59bac34c427616ba830ff78e77cf01c39abac90e9bbee2f5b5", intel: "1389a7704e3f56e4465eceae1c9b591d60659f7143eaf80ec74a0f7bf009f893"

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
