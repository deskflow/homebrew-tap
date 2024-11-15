cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.1.45"
  sha256 arm:   "444ba79071ba3753af4ec44187e451f8033a399126b7f7f159445958cfe30c55", intel: "eacbfc3120ca7d957b523e3a0c729aadcb9f8b52dddd5a780a611c52be0d58f8"

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
