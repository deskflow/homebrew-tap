cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.165"
  sha256 arm:   "f320cf1040529f7a05a4688689acef94d456b239ea2825cecfc5d028090a5be8", intel: "3b274c11e0f1b4e4689d389c36f1d632f35ea34a33c5432f09f9eac4a5bbd4b5"

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
