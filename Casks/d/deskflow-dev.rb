cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.76"
  sha256 arm:   "492c437204145d3da63bef24ffde5eb9913d56d894a6a5c87a24b6d83c6f126a", intel: "4a728291f5a064d150bbc037c26bed359af8de2f7bb2ba785d050c5d61ced844"

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
