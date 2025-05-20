cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.251"
  sha256 arm:   "4e144a609317afdd74f8764e6f8a626558f0f45f0dbed13411eaa98a9322d8d4", intel: "05e2451ce3f380c6eac687201bca9d900b7fa9948a14c7c07d9707b16dc720d1"

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
