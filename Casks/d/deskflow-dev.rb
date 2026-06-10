cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.230"
  sha256 arm:   "a625d7865755058147a53b27721bbaca8e131e22b91890d3cd6ad48f518e420f", intel: "766b0bd9180388f77a9c01bbda9c8a9a754e3ccc068a567a8dc3647c825750be"

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
