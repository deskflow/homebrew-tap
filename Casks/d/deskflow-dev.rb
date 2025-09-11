cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.208"
  sha256 arm:   "a6946386275a862437a840558ae037c1cabdda0daaff5b7f4f76e365162da2a4", intel: "6a4905e8157bc60a2ff7d417d48a5d6ac75950670b24d4515a88a42d1aecf568"

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
