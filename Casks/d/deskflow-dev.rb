cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.99"
  sha256 arm:   "1c5d051d4bb5ed17d32b01b738ae479c8c8a10ba1f9989e20735c5312d3893f8", intel: "1b183a09046f11054c9fa5be5e0f20de1a84147e6d18ee50e4dcdc9b2a9fa550"

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
