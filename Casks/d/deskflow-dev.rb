cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.331"
  sha256 arm:   "201f1c9aa11adec886b7733a1b45c54aceefb3c30bec631a017edbb43fd95b89", intel: "ee5b0c64870ed9464d2319944510ec4974713d9b1e03076d306cc91dd2677c3d"

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
