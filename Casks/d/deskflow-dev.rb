cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.161"
  sha256 arm:   "047c50ea1804addde76582f96df1c8ceb9f62a76564e0fbe38f93f723967ca2c", intel: "a48d8892ef458760d6710e3c208980319566507978797a080e1c5e73ecb10aeb"

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
