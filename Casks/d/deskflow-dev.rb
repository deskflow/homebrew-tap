cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.63"
  sha256 arm:   "29f5ec6bed11ba2ea55ec7ecbb5945681a565bb9f517c3a96bd05a601c644fd7", intel: "e45fd3c831dc4ae2631fe8cd9dad090f8616fae30c28727665f189f319a03a75"

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
