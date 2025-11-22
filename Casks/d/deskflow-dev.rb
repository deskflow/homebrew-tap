cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.4"
  sha256 arm:   "d6d28c9b5de9347794b8fb69512b37a2670165c9c166186941601aa1a686de70", intel: "e76958278c7d6698786991e63979cfd833adcec4e9d49c5734735d37efbb4af0"

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
