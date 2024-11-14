cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.1.29"
  sha256 arm:   "625109bda64ab03de29c87603498f4331b6c1559a2f0b1c768c7748a7938a898", intel: "e4a9ba79474cd712a67d0519b20dd2231abd6563ab25eb3bea73d4f94534cfee"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
