cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.262"
  sha256 arm:   "e473c0a063738bf3570c833eb67dccee1f03d299cb174b39ef11dde56f38bd86", intel: "8898154e4a9d38d099add1c8c6786f5f6dec9d10f0e7fd2a82fe4017a8705091"

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
