cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.88"
  sha256 arm:   "da77627186a9686d5ca8e43220a943664c31a1a38c5315da7382787225994c31", intel: "16b974bc9dcedba56d7caee04bf8111275276aa1816fce1f5dc0a8df6ed4ff31"

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
