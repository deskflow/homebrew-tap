cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.214"
  sha256 arm:   "ce6203320ee9e65c710c6a88da5d0616978af266f4542cbef71e8048a0574388", intel: "565ceb1c4488fcb3e4916f80421a5ee7499e4351489e48236872487181c70363"

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
