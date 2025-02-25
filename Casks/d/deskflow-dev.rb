cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.89"
  sha256 arm:   "8b0e4778717cc80456fcebc027fa7b207d3b000b6b9f61d32a50aa72ee181e9d", intel: "4ea5a3c807b86512ece6bd314b8237ec24268c71a7e3bf96a9e8ee06f80a82a2"

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
