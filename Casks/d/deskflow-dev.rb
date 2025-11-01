cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.193"
  sha256 arm:   "478d5638cb823f9a8dce7a6ec5162a8c1ce1ad3e93c0cc0adfea7677415c5f67", intel: "dbb17d762e64829f28b52f2923f290ff62922377f84bee12a5e90ba1b26e0914"

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
