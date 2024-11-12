cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.1.24"
  sha256 arm:   "ec0933f3af96d512fa8cfe999ee8a306b70dad7de796418e6960601e76a727b5", intel: "a1829cd837adac8a8ed0530f0dc60cc7c30f252e210141f09ee19fa396eb04f2"

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
                     "-c", "/Applications/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
