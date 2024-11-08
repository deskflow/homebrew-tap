cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.0.200"
  sha256 arm:   "7de75e3ac63b3c6e04f3a46fa64e2851bbaa45d79a07ae91072f538a40fb8290", intel: "4d022f6100a58255ca93b9c368c276e31c3053bdfdf9981a976b8fd1d4420949"

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
