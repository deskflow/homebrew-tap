cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.53"
  sha256 arm:   "9bcf07dc49e0620ad31f679fdbb5d4c4551b35f406fe7dd7b03b899985d2662c", intel: "9d1eda421ea056754466d72e1f8cf4f0aa2768d37ac59eee76f7d730a96db77f"

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
