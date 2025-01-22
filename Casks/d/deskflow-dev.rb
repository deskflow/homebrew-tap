cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.139"
  sha256 arm:   "0582160d63735195714e27f19f3ad14387eae56fcfb57a1598545f979c908998", intel: "1becbec00db2ce9e27da29c3306d10cafda3a1c1067b4c4650d0dbeeb169440e"

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
