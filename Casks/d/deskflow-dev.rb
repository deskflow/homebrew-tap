cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.145"
  sha256 arm:   "e60de0142fd04c4939992ae5e6b68b22468deb780c98f515d3d351680fcc7d49", intel: "8b8c3b612d74160c1c81475cd26331482d5ad06da6e26af4b6aa99085b1533db"

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
