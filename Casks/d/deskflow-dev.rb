cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.149"
  sha256 arm:   "c1ab83f9a21a728bf7be2a00ddd7f606facd42949c98a20aa3075f649b5c3a83", intel: "66dc69ed2cd47182491a174e956c01f7dc3bea8fecbc6d4588ad500d1eee07a9"

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
