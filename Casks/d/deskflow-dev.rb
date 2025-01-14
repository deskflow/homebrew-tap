cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.73"
  sha256 arm:   "3df046db4338a77afd5f0e34f8ed8eda03b2b36a48c6366f904be7cc504730ea", intel: "ea551c3f1d3da5550f70e77f3d812f81a895a4bdad0c0d1dba20c84fd51ee840"

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
