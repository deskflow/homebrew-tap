cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.51"
  sha256 arm:   "07c61110b9e2e9addcebcbd16ac33c8899ce9eb389f9c9e4528532a818db110b", intel: "c2909eb7abe8ec0463fd959ec9cda820b67b4918e7687338a4e51d4dd6b17112"

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
