cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.41"
  sha256 arm:   "57d84ae22692583ebb3500c18eb7308ff5a3418eeb0ed9e76570d47573203cc9", intel: "6aa1bc48f1b7c0395d15368f80cd95cc32a446f07a073dc7ca1d45df71ea4d0f"

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
