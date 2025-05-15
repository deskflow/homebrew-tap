cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.233"
  sha256 arm:   "3403b7d1e5fd6f463453afa17889b8d6d53cff3dd8b5142e217c59b839b616ff", intel: "4608e8149f1982602b49619a0b11ae8bbb56ec19b23873c3ac8d43988ff94c7d"

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
