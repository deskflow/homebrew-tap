cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.375"
  sha256 arm:   "25b57d105e427668d6ab8d33eb780d8f1360881e54e2f7b4d3c8c22a665ef315", intel: "876dbf5c852400fb5793f9e71b86d9d6f3d7f861c44a5274cef7d5c7c6d44d8e"

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
