cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.64"
  sha256 arm:   "2e02511e36e79ff05d7f4f51d8d7cc79c153ea3f911f178bed3810ae05c25fa3", intel: "1d0f2ab83ea0288317ca91ea69cfd1ffeb167c7cd6784de32b49cbe6cc22c22f"

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
