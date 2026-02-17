cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.1"
  sha256 arm:   "bfa2b15163de7d73063a0e4753928e41a3d271baa33a14c0d4add70973df6cff", intel: "f457b40836de08a26ae79c57673f4606b67086215b96f08a7f0283c7437bfad3"

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
