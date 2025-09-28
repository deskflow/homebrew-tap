cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.31"
  sha256 arm:   "b8d4159cdb52adca7899fc6deb96d460adafc0e63bf9972c5cf180438a8ca4fa", intel: "f42a989a06e1a067313e621204f4ed4cda1f4263e12029749496d8831bfac26f"

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
