cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.343"
  sha256 arm:   "1147a53d71fa3923b14e91ce638f6fa75e3a7db2a988ca60b12e60833338ca85", intel: "81256a709d1013e0f740110a2360bd0a1b0e9a9b61f9f2040b455d57a8166f99"

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
