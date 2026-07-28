cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.338"
  sha256 arm:   "da3d19684f21a993b13e5ce5c3e799966c5261953355ca720b3aecedbbd15144", intel: "af8bcaabf29473d35e44cb3fc8391092d382e09376e66fb2b8eda2e93f2df705"

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
