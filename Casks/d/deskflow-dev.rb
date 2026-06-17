cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.252"
  sha256 arm:   "8ade94cfec29e28f28ec6b1871dafeba980e326b59d823751c5b217953931219", intel: "c1a4517083cc4fe7fb594fe07bc766c413af51fbb9d36a2b75997adbef61500b"

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
