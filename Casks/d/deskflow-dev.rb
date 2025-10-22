cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.133"
  sha256 arm:   "37ce47f798ecd7a6330fc5251a7cb250c250921b21ca4e9a90361c2332d7c5aa", intel: "85d2ada3430d11dd1cd6de15fef8327a4ceda1bb29ee6637c387c2b19eb7d03f"

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
