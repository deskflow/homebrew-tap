cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.38"
  sha256 arm:   "75f4a79e9bad6d346328b983fec97883512a51a5498cbe34296be452bb7ef063", intel: "b4e8ea0c39a065f724e8260c95f17126b7e7ea6cc2cb77e03194e0c19731636c"

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
