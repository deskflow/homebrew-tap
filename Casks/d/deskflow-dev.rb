cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.70"
  sha256 arm:   "9f6d378a4752dbb8465899d3105c4e05d4ba0f71b7d554e5dbd37aa839fcc9ee", intel: "6c5cc9094ae786516646315efdf5ba54715e1daa31271243d143b3457154035a"

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
