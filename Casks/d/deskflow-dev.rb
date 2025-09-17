cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.9"
  sha256 arm:   "3246e54d2f70b12f1f0410e9610a5f6f974c9a0e9f49d146d8781adefe685fee", intel: "dde4f4e884ed78f826f8766694d9cbbafd198b99a3237082eebb3516272b54f9"

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
