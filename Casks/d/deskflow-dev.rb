cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.81"
  sha256 arm:   "5e31053f05a38e0b84ce626123569cade60bad528592d5041afd10fd13ed1dc1", intel: "ae607bee54c867207d74574fa9fef0185c057fea4eab7b28ad849542a60d2b5e"

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
