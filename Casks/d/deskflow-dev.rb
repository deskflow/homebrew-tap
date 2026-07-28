cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.334"
  sha256 arm:   "9633ddc789a126a845df12945c66146aa4eaf51eb21b666384cb5e0c825826bd", intel: "989392855bbd23ae5a3661e7aed62d78792f27763631bf70d8b641b638929345"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
