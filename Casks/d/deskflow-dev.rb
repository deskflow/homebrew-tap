cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.110"
  sha256 arm:   "dcd07e8c0282225ad7ffa62a1d646279fa24bfe80a167848e573601d9766e8c1", intel: "e8f95fdf00ac4f7249c0f538e9acdbd7fea0b340926a43b4c90f68a7f3d5fc2f"

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
