cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.87"
  sha256 arm:   "e91ac789c9c735fd702c223f5d17cce35c45015176b3a9007cd7c288ce18ef96", intel: "117bb5e2abaa394f847395bd8bd9b5167abe3ab3a2eca95f421845a77ebea3d5"

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
