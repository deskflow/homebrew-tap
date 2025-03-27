cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.228"
  sha256 arm:   "92de4afdf8efebba306eab511a2ebcb073d0e20ee9bb95deba03699995e9506c", intel: "ecb371f611a7d586e7f1a126f708fbee35141164e4f6b9ae5d587a88a7722da4"

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
