cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.318"
  sha256 arm:   "f3e389f05cdf1c189d2bce00a6dc256d2d0f5dfb2d5870dacb1b6eea3c800a47", intel: "e4909fd2e051403302b9bd0f57d42b124fd7ab9f911d65cf6ca11db47ec89165"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
