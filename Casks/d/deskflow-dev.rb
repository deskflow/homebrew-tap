cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.103"
  sha256 arm:   "8756685b15aa188d8b78a63081e28d7477aa1ce99e9b4f0753fe69055a547f95", intel: "7031970b878e006c3f09dad35da00fc213fd9625ceec04e8ab2aa8ec039a0b6b"

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
