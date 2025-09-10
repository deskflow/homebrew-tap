cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.206"
  sha256 arm:   "f62c44fea093eaf4414fdeeb26251a2c81b3a12f7ea4552b7f8ad297cb8b8aae", intel: "e3e46809b47d3b5b0f3b216d877e6ce073acd118367330feaceab0e1669b2aa6"

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
