cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.171"
  sha256 arm:   "b4ce0371a314efda8064b1390f6cd171c4e1421c62679554b1bd2d53c02d4570", intel: "adee1d23380b9b3541e3c24d604cedafdcc7aaaf3b67586c4c6cd656baa5c05e"

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
