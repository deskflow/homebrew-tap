cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.225"
  sha256 arm:   "b2bef17f233eaeade815e56e5b39600258ff7ce2a8b0b21606059eb3d7b3921f", intel: "eccb91841b4fac35977a05220191c8c7dacc3ebca94381ea25a393828d3787f9"

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
