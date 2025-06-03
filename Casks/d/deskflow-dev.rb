cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.6"
  sha256 arm:   "5cbe939f83d662479d7beb46410cc4f54e5a4837bd882acc044a851a2b4c4f83", intel: "fe2f3bcf3c55bc1338666226c1f96f80b820c01fb3a5e266a1df2279db16e0a7"

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
