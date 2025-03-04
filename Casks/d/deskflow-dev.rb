cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.0.2"
  sha256 arm:   "d317a4646703c36d4f0562d35b706d735241e5222418f3da8867292ea0204079", intel: "ebf86e4615c976825006bf465bdfacf58a20379635f1baa37a36b05a04c6f75c"

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
