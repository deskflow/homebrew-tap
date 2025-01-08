cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.44"
  sha256 arm:   "784be5ae2648ca42430b000bed17a35429700d676f012f16f8aedff2d02078c7", intel: "647d6d081ca84f8255e7a2852bd4fc23578a62403a1cad5416de7cc2f49d2929"

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
