cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.17"
  sha256 arm:   "36548a174786bea2d8df1b9f10391a3ffa7a22a81b3d2a66b1e0f194566f917c", intel: "99772497bb72a0c173e86cd0d4306e25c5f23ea39c6043af894e32986d3aa667"

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
