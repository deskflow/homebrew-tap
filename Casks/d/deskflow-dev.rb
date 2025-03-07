cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.0.21"
  sha256 arm:   "9a88ce136b0a0680703c29d90aff2a01f8e1b33324e0cf783b7638c3ff1a608c", intel: "8eca118ca9f7c3e934cf2292457155b9a4bc151fec32b33dce904c04dfe4e62f"

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
