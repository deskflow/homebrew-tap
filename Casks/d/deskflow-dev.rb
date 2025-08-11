cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.75"
  sha256 arm:   "9b053c5ef83948dc13c3e777accce89afbaabf112e6906b9f7c88e32173a98de", intel: "7d3b5884369127aa57e81f50d346f84d684d63dd9c16a68f384a8bdb5e4301e1"

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
