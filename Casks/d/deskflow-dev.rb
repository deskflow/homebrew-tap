cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.1.4"
  sha256 arm:   "19ed48bd04dcdf5913b9fd0516d85b8aad823aba70130768445167d68a177de9", intel: "ae0145c92e62c2e40ff8a16bcf92bf1a386941696791a1ba2cd97ad52a64a060"

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
