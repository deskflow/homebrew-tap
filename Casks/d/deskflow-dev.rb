cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.0.25"
  sha256 arm:   "989de7732a58594d42af172a3aa9f2313af63165011de2faa5826023e287f671", intel: "a764f9cf81e5961336b5e22d0fe4702d6f3c2ab5d86130cb9529620d92c85c9f"

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
