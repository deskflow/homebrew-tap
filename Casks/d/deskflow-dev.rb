cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.14"
  sha256 arm:   "5fddeadbbaeacaa4597b5d1cc9588bb86648bafb5eae86e82e0350102e9102da", intel: "5a8080eec71d56e08ba84a8898128dc241a746863938f2cc33599a2b7cf9c282"

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
