cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.20"
  sha256 arm:   "409477baa6cf496de472381e395c8727bf4916b805df3b7a3fa6b1d34af43b1b", intel: "5a64ea76a868d68fcfb4d1e841cc2095cdc04795165438426d296b7cc1073fa3"

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
