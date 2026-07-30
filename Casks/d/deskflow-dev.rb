cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.345"
  sha256 arm:   "4e27b78476662f4df876496d47862c458853accd613d1a2897e4771530ac6eaa", intel: "67e6c40d31f0eb44b582c7471dd91d165a9889d9010b2ac254862ec92c756d2b"

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
