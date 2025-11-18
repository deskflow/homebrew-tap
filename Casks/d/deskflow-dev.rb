cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.368"
  sha256 arm:   "c499df1fe167db23796a04a3eeafd51fccc40a0452b028bfc4cb6ab4d46eed85", intel: "4a7507aa4136a742f0b90b67f39096cd685e8e1c6d73d9d2c5eb691d096ed33b"

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
