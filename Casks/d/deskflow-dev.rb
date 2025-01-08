cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.43"
  sha256 arm:   "5409c6544cff854cc59febd9e2af30af4322764de2c20f566c129f42817a2040", intel: "0474b00479883f652716203c38770604f790ef567450f37a0a13a9697379e4cb"

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
