cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.1.2"
  sha256 arm:   "5cb2a3413377dd67dd840a6a7a50fbee263894e08f8e8b34ed4ad1dd6d7dea65", intel: "e1f88f6beee6f8a286065992081aa261d83e65da4d7924d41cf1385582e25ec5"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
