cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.160"
  sha256 arm:   "98eba060a339f32a73892e3d731a5df1dd247b3648f1f45b6e3ec40a0b7cc04c", intel: "f914d7d1990fae8e3f25a40c864a4726c46f30a95784aaee0478ee9c3837188d"

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
