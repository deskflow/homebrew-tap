cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.0.3"
  sha256 arm:   "cca27eb25f6e2ad984e5fd0c6119315a29ac32f29feabf65a9dcffa8ef6a51a5", intel: "2df8d06f18cc9ad272e91d445d7be15319f21c836d4ba355ef2d59dcd4c9c106"

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
