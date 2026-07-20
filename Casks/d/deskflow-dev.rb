cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.324"
  sha256 arm:   "69ba6f534ad81751c4c0b8fe1da30148d3d5be21601d8bf46b73b00253c6c8e4", intel: "d46eb69376b61836dcb5415e8d8ad445db1545a6a1c0695940efc9fcef999891"

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
