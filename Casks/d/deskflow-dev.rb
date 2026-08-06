cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.356"
  sha256 arm:   "bbf6d06c120167c0bad1ced099bf62988114ee55bededa6c301040d12dea26c2", intel: "bb69fb582842a620b8dc0807e3bea3fd32d39a0c586492ca46d3be0ca9469f44"

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
