cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.244"
  sha256 arm:   "652be32d010e15896063615039f0c091df1dff7f33d2d9d715611cb72864d7a2", intel: "70a26d34e2bd49f3bea66ef430f0ed739ffc25a4fb1fda20f163ff28f6c3b1a0"

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
