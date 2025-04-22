cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.25"
  sha256 arm:   "6b59571c77b0c177a488f938eaf1fc0131ab85674e8ebf7a41e481a1c6cf7ca7", intel: "4b324fb88afe1ff370c3b88595a9698fce627d91af3b1027ed0f5c14a2727b68"

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
