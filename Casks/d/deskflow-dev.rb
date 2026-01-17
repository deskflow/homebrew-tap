cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.164"
  sha256 arm:   "fe4085f41545fc691ff45d122ada0a1f9b62532762af9ba8c99a15d91d922404", intel: "4d96fb51456f51fc740a8e820a9f97bc5f971cc10cdf28d5f1ab077b57f9af57"

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
