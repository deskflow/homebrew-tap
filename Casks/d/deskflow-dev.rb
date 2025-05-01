cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.96"
  sha256 arm:   "13237340e54911d7eee4578b36c711e257535d3f2d05498830b182e54ed7708f", intel: "190c50f6ef651412422c2a0dd05b80d0fd256e7307b95a770678357a56338eb0"

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
