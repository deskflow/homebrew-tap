cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.130"
  sha256 arm:   "597d3d6931ae7ce7f736801f60b1f908494e10c5bbc616ae792646fd6c55aa7e", intel: "ffcffc39902973f59d30c920aab562a80a1741de876eaeaf6fdd6933c054430d"

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
