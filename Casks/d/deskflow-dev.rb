cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.170"
  sha256 arm:   "aec0dc7796648437f0621afe943d2fedf44685e150822edf26f883fcd8068340", intel: "8e870baf35be4e060b1ca2a7de52f9ada47872216a4b9752cfdc785c25e2d1c1"

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
