cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.92"
  sha256 arm:   "ec09642876f06693e12101584ddc481292cb2f7541ca9ff3dc4779c22d78dc81", intel: "41f40efd3d623bdf33ccd54df4f6b2862906e31e8d2d2dbaf3f0134ee5b91661"

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
