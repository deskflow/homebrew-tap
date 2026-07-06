cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.303"
  sha256 arm:   "a9255879531cfd9c4f9f5f088c474dd6536c220b7262398d24856a8ef989d613", intel: "bb6b090aef7d9ec0a7068153cc773306af9398783342bd9f935b8989464a4323"

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
