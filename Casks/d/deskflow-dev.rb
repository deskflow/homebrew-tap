cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.153"
  sha256 arm:   "53e7e07854ad2ac2625039a8ea8deffaf26c09b111d819dc412ecdbc95b3ec43", intel: "f5b3d7e42da0011c76d83409ed61074388134f7d6604a5a82fd9177a752c4894"

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
