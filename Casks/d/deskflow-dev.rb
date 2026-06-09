cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.228"
  sha256 arm:   "a467a8d4f2d47571d76899c52a5a70cdbe0445326ac75bf19b4bcf5ddd5af39f", intel: "18ed8527cf7d83b48b7bf240d0a55cf29513850dfed809bcd8cba393c7cad1f5"

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
