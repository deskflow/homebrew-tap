cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.19"
  sha256 arm:   "5bdf5f2adbc30bef6207b5e8144cc9ba438661d0641219f0d5a59dea07ddb0c7", intel: "301587c3577759f624e3a951f322d066b739e0d412d76bf81f0853c86feb24d9"

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
