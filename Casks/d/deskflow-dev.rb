cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.20.1.3"
  sha256 arm:   "f4208cb858ec2fbd45f2d3c4886c2f4f1f24b785c09b99e56ad16129cb93e139", intel: "27dcdeec464ca8b44af381b9272022b8feeafcb58f8487a265722e268adc3da4"

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
