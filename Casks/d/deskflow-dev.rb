cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.77"
  sha256 arm:   "836a19bc8593af7b53f476e508d48c80e199438819dacb1182bbad8eda83a1d8", intel: "3a1f5153de633214c72b369163fc10fe415111ede5b699962dcc464cff680789"

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
