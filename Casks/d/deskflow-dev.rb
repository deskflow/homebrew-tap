cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.49"
  sha256 arm:   "a8996833e741e1d07b9addd2f5c8008c59a37ce358bc3dcd21e1b42e58e26026", intel: "749e8ee4cc83e8fe37659d41655cced8a35b0cda1ef050c95fac04b56f1efed8"

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
