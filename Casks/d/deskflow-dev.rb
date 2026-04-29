cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.169"
  sha256 arm:   "d0d13133bf27ccc74edc0a141acfd06bbcf740223decf187098f641cbca25cc2", intel: "4764994409a2c3096a5d4a922f1be7686d6b36d92589ca3aea5cf0cb25ae8230"

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
