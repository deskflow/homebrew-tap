cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.232"
  sha256 arm:   "8d2723393678eccff88406fca3740427346a1f51bb75e569e73d1517dca395c2", intel: "2e563a38b853af8a271676d1b5cc76fbb631d4b1e5bca559f0cfa5edbd84091d"

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
