cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.108"
  sha256 arm:   "de6c853e3a52f2fbcdfba46b839dfb03388f64b0dd05b37e3c890661fa7b0c98", intel: "b47d2ac1fbc4d8ee5762f374fea2814993bd97ca9ecc9b1ca0c5ed1129e34689"

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
