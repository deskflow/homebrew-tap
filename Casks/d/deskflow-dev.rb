cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.79"
  sha256 arm:   "1bedd1f3cbf34437d587c26aaa7ab34bbf69bd192a80c94272fe6dd003df8a0d", intel: "9cf524afd4d6fc8304274cf19ec6f29d6bf3d3a2021d7a77d4715f4fb8b55357"

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
