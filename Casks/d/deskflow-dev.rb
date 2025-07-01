cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.117"
  sha256 arm:   "c3a7df5829713e1de0bef3f4859f6830e855da3834514afea115cfa8baeab594", intel: "a235bd07949c45ae17c3d59b1fc4dfcb999737d6d37ef0d5ad95fe90169c6ab4"

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
