cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.301"
  sha256 arm:   "bdceb5bf0da74c5665c3b301cf92d61cf6fe804c213d71c25e8415dbd0c231b8", intel: "fecfde3e882e3e05b8c0220065faa7834b9fa9db3aeb2caae1eb8cb988a3c6ee"

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
