cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.218"
  sha256 arm:   "de303c21a7344c91d487a6f82e219c5a97c0e37c55b05cb947aac763ea9ac173", intel: "0214280c757bc9632508dcf77ebae11d53d7a1bc1f65cb99fe912aa06b3fa808"

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
