cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.29"
  sha256 arm:   "78f9cf39d2b70628ea35ec503832f3df3fbf52804a50537a8d6f4dbcb7e8d28b", intel: "b59c8432bdae61b5760ca329720285f10b6cfe1f30c1d9fbd5a710cd6bb0b8e7"

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
