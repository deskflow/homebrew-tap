cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.0.1"
  sha256 arm:   "8dcd94e2eac87680bfab70c448a479f007e6ced007be39c5b6f72635ec452a65", intel: "874a7db1d35894bff849fb98425036fb88c043d7959b0b1e38f0a97e42c78f9d"

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
