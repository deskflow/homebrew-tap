cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.237"
  sha256 arm:   "dfedc1b3b8a30b7a34640ca76438f6e5cce5c4632182ecdcfc9999361196bb1f", intel: "dfa62d650009f4fc1943583761e9afc2f7d3d92f1b99accdecc4e94da08693ea"

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
