cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.322"
  sha256 arm:   "76c5efd3544e108498a140a504579e61b25bebf8e99d13340e0dd4fceea58949", intel: "72aa703cbfe5c3aba6a1f9a4a5ad17306b469d1960dd5f47c21df413b5636cd4"

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
