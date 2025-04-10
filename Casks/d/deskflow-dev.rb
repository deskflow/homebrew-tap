cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.4"
  sha256 arm:   "aa8458a1cb37644b36a3f3ca136d8b2fcb77d4c06f31b5c2f370082067a7d631", intel: "47bbb1ec80566eb69da9e1aaa573eadd4e1205f8588d293dc7728d8c493bb445"

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
