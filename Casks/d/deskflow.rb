cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2"
  sha256 arm:   "0b06954f686c1e8e2e46c4d12f741ff9999607002d987d93231090c54194012a", intel: "8306c3898b0d906358edd46423884262243a9a02a31e08b91e454aa1dc1a3f1f"

  url "https://github.com/deskflow/deskflow/releases/download/v#{version}/deskflow-#{version}-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow-dev"

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
