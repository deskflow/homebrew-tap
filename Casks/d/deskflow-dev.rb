cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.84"
  sha256 arm:   "f1e0cf55bdef71fd375202ec0c9264ae27a9ba4f185c739b62d9cdfe9d281068", intel: "48635a249222b8231932271423973e62214a2b7b3f6706a1dd075e8bebc19bcb"

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
