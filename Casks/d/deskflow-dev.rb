cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.207"
  sha256 arm:   "dc1911832bb3a62661b3318c8cc4c30e3c7d2de803fd2c2e9515e524aaf08389", intel: "a3a38e92e4474dabae80c79728f4e81c42356efd9cf68921590439d6e53ffe7e"

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
