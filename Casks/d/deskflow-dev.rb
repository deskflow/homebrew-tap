cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.87"
  sha256 arm:   "d07864356e9ce8290f7e8e79e83b930fda594e4739391042da8561058d499fd0", intel: "cbe08a97afb6a67be1fa13d27ebcc849bafc15fd3790acd6c14bd9128d3e26d6"

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
