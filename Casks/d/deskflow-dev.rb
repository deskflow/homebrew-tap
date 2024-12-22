cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.89"
  sha256 arm:   "551951ced69485dca3224a368637804a74075d95bf5940c55119a4e70542933e", intel: "59f5812d45aa075761e128afa3d68ec188ab9f5a782f9a5fe7a2042d843c7aaf"

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
