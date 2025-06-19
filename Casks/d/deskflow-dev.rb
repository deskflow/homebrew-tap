cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.74"
  sha256 arm:   "e39f8941157cd6702d63b502bd9354fd77e162ee0cbb14dd512c1fcae24dbbed", intel: "813b98c4100ff1b0698fea310dc6d6a589b9b7ea1f26980ac771d4ff17a01e68"

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
