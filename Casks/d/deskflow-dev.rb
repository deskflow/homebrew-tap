cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.407"
  sha256 arm:   "7dddf8d9ea99192eccff4949b633437abaf511ae9aaa938a911baf0c4c0c7318", intel: "e5410c5c03d3d47d8e5893af1a9107e7b3ccadebac3a61ead0cf72e10d81033a"

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
