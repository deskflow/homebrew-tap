cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.205"
  sha256 arm:   "e5539973fdddd07221d71f8b0562fd3e0f9f98abbcbd0e0f6ccbfff0ef1d0825", intel: "7c8fd2f5f470a405b55bfae86097010082b2abaed30f9a2e9afb9c3bde7f7014"

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
