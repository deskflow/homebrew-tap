cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.99"
  sha256 arm:   "1291423878b5659100bbb09de9440a7039b35be5ec41bcedd04cf5f8aff46f45", intel: "e42cbf533ad3fdc3a02b824bc57f1632bd9488685a9b8df4259cd620a0d5889b"

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
