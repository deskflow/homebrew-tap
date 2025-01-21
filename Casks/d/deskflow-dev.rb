cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.133"
  sha256 arm:   "f83717a2a72994435c7464befd340e5bb5cc4507b7b055b83bcb841996eca4ff", intel: "d95a0d4825727123add7da579db5255907d5a68c1fd0e50a5c7d4be37def3bb3"

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
