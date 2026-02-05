cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.222"
  sha256 arm:   "04897dd7a68f7f91c7b82006cab25af2e15d4671363fe9f0b31f3bf3392fdfd2", intel: "4e99587bc8654249b9ad04abeb4f404ec18b4fc2508927c68b2dd33a77613f06"

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
