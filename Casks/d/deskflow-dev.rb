cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.163"
  sha256 arm:   "e17bb6ba60b39bb05299d8c0f6f87890f71f265468570fb799ff15656d86e41b", intel: "53b32dbfee780e8e8dac977123fc785b6ea5ccc9f24a351d6879b68ae315dbe1"

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
