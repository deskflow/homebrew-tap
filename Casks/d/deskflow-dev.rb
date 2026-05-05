cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.174"
  sha256 arm:   "be9b17a7d54f2925c67d3b9c54b00ccb4498c27d32ecda1f21b082d01a4bfc44", intel: "33a0c75dedd8b757f87e3ad495ebff86da97d168a2b08b0bdaae553ee3f70e00"

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
