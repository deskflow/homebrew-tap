cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.372"
  sha256 arm:   "ee490c113777a61be8d281b5e3c2d3c081f253e24e06d7cfe5b2baea11341cf5", intel: "6fbfea8415a81902642ece39188dc0b079e2f9a9bafe7e85824d113fcf2499f4"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
