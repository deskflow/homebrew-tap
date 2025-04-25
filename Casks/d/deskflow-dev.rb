cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.33"
  sha256 arm:   "8b47ac7273b6411a9e14d6f36eb7293fb85fadd943659d7140196f400d17f735", intel: "6c70ca1dcc0e3f8be087a3bf8aa86002411a38ba522fc44cc7ea26eee6eb14b1"

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
