cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.156"
  sha256 arm:   "41666a55c805c24bf81cc650cc29a19a2fe43c4000b5f1ac9d565cb9e99a8007", intel: "e0d6f45eb7be2346fee124dd79195c91673faf4d849bfcde51729ac7af8d9b20"

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
