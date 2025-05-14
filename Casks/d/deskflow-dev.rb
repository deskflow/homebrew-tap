cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.231"
  sha256 arm:   "97adf81904f26f5331e183e6eb800e3ec1ec30f480968e5c01f2746c61c80040", intel: "5a2170500b87e79076b4fc65433cb0e85916a84bae519c9befb52548cfdea410"

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
