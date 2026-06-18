cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.262"
  sha256 arm:   "416661ec3f247038920878fba361a77c379d2f30f38771afef6dcb188608bc0a", intel: "3479e6fb627dab05abc9eba520983f5557d43ae9e2883d85b50a2564a6a2f924"

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
