cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0"
  sha256 arm:   "de2be5bb9bc318c3467ade31bd758002d2cc70ea97ca53c186d8c3f8c48c1df2", intel: "d7d74b6d54ebdd07ee57589d591fcf88ef6476332239e526b4bc9faa691316f4"

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
