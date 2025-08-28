cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.158"
  sha256 arm:   "48a0a0ba97c9b69477f96dace9a3c34df2f24b51dd89ea269faea42ef6ee96d3", intel: "f7c628bb45ffac4050182cc01357429cbb44c687f945ff07f79577861ba79ec3"

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
