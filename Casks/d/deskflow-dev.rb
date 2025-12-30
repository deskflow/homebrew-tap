cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.128"
  sha256 arm:   "4328914000532a1f48ba947d4dff83ce79ccac6e39ebe1c7d9cb50e85427033d", intel: "c89a5e91ff5a909005cb1471a9a257168d1e9a2a18e82f6f1ba42971d5220253"

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
