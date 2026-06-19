cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.285"
  sha256 arm:   "ff0e19fb3538082fefb54c6ba22ffc145ca1d8623fe37fcd5a6b4b0e3a89b2b9", intel: "797c8fe12bbc1b76d4a927e70075b88461b6d66885499fb82e5efae4b97e0ef2"

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
