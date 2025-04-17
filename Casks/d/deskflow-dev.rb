cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.16"
  sha256 arm:   "cfebe3a8821c2206be6afc8a5848d31ac2a0402dea3da33b26937f0999a19eb4", intel: "c78aea4a63f581ef58837ab3a508668d0e2c8985552308da6f67e29e6c0918bf"

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
