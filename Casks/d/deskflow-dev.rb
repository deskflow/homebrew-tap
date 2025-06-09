cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.23"
  sha256 arm:   "0b7a21801bdd19246b224d870226d86fd08ebcafba59539c0353fa1f69ddb14c", intel: "2930503b037752e705ed3044852b0aa8803daa4c3f0b3070584531d033e11a3a"

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
