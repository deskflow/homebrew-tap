cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.212"
  sha256 arm:   "54a5ff55c435bf7ea79caaa01f3104d9ea3a2e440dd584e4bfbe08dca5b1ac2f", intel: "d94305c1fa1a8c988c3f7e79c2ec73b19d2577ca86d513c06b9ba1c09a762f40"

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
