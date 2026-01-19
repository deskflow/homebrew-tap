cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.167"
  sha256 arm:   "4a6fa724738bc22dd9cd37d7b109ba5f76d3e6af3e3ada2644bdf35d492188b7", intel: "637bed88870970bb4bb45965896afed4940687e75078070ff8fb8a4c189596a9"

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
