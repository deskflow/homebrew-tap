cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.361"
  sha256 arm:   "b459f47dffb42b141d4e3f1ec0cfea2a8d3f4a64f90b2a092b33482ebe1abf0e", intel: "d5264f6a49aed63c715f6020b008c2084c796d97ee7bf2c97f5ca41b7911506f"

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
