cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0"
  sha256 arm:   "8fa595615d27bb71e4920ea3b4d4393ef7216cf488d6809e9f8ea87a1db1eab9", intel: "6762377b1b3e8692cedda66bc0615e55f412b6d8f1af96e62793f9e8a8571071"

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
