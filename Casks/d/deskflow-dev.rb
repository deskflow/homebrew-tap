cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.94"
  sha256 arm:   "68a9e3a4287e5a3e58cf1844df6b529bd28313ccd761bb5a4efb73bf1f9d18e4", intel: "b206586662cd46ad5492c8e346d304e149965631dda13135248e584f45ef4222"

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
