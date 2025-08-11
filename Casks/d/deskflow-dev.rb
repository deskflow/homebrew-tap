cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.105"
  sha256 arm:   "72e28874e08ada8eab8d69a62d0688203dc4f076f0a662664eff0b65bb9cc7e6", intel: "2d0b004a804fc8dd70b14a22168f6cf59c9925670e25f58cc693e51690932edc"

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
