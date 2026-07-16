cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.315"
  sha256 arm:   "66fae6c251aacafbfc0555e656651f559d336e6df34ed99fe50e8af3d5987fe6", intel: "d17cb08d043fe2e608c3414e1b7c55777dfb3b2d0ba373c8da8ae21cca61a2ac"

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
