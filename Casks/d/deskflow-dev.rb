cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.330"
  sha256 arm:   "d362c9a87feaa6af662f4d93eb3d6d4777f12f0679db6a9da5e8dfc2fe6f1419", intel: "5a6e05e2d351c291804cf7ebc6249684964a2f728073463d1b9f717f127c08ff"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
