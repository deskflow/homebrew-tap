cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.116"
  sha256 arm:   "c684bbc8b780c49130a3aafbc7064dd77713382736ea8b591f1be2a62d1aae83", intel: "289210672be120781d30c07eaf5f54f23f62677115ba3bac3b2431f7cec8d9de"

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
