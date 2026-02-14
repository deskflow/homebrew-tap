cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.248"
  sha256 arm:   "14edeae70f0da215112a6675378f05e41b06f152c131077f4098494f9b635d53", intel: "b8e373d9881af8a23a9460f3939381fcc724bf740cf4ccda74fc1f950850b5de"

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
