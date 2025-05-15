cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.234"
  sha256 arm:   "32e57c212c4f8dad450cec26c7490155d05e902e0d697206c7d9e92be12683e0", intel: "f7d361509a6c1bba10c4bae259137d1f272a4ae0fdb95b8ae759cf8c8f0bfef9"

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
