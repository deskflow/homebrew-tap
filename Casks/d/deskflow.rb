cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.1"
  sha256 arm:   "97be14575420ddf4352072f2d0e93be233c46ee99a38391f176c68c6a719ee35", intel: "c5cb97913fda0a997e9df0ee7b73aec3fd42d47396c8acbb2ae669453b08f21d"

  url "https://github.com/deskflow/deskflow/releases/download/v#{version}/deskflow-#{version}-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow-dev"

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
