cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.164"
  sha256 arm:   "4240c889d582aa1e41884e07f5aeca68a5663abf9799e331ede3b6ed6cc1e15e", intel: "bd6a4dcd2495ed25c402a32ca59cf9f6e89b8827a6c5d9f36a524da52dfaa458"

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
