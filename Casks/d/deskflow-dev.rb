cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.33"
  sha256 arm:   "a0232a545bf4ab1603e19981c8f7166bbb464662d362340e27613fff9582dba6", intel: "c7cdd5502352a6ee2fd0bb0692e96a00a117a4c63ae3fa084495188eb4650696"

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
