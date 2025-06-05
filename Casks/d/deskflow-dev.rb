cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.8"
  sha256 arm:   "889048307a901722b412caa1c8d9516abb21f00c42922e624546971581cb70d2", intel: "2ed02e97a0b19ac7c73ec41414c6e359b179897eeca465bb362ac236e870b5db"

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
