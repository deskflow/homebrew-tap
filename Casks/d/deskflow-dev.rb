cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.388"
  sha256 arm:   "813c8fb0c1c406cfea74cc7dc8e7d3d5cc472dabd9d3d2aae725d3363566cb2a", intel: "734f76faf0d92acabba2bff434a58790bfc7ff9c4ca3ab2b4733fa8bde9bbab5"

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
