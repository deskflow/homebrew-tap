cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.288"
  sha256 arm:   "8d0187e5b4086221233d94f15aef03de9f748c475d89974757adbecefe8c141a", intel: "da067e9f0e204b13f3051eec47d93ae12fdf9dfa1175c5a3adc2a08f0e4ba3eb"

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
