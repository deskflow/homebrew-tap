cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.167"
  sha256 arm:   "dfe4065cb89a20145151d330c2136e9880dea8864a069545ed3c044011010eed", intel: "8447ecac2a67a7b462b0970bf4b22159b04232e7686c0dba2153dfecd98727f9"

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
