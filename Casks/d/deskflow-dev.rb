cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.399"
  sha256 arm:   "5f5a004ed1ca1d85a871021799cd5ac99fe6190bc9e98d8ae5de4200d2a24b4a", intel: "2cc96e9e7ba8bfcc11163aa400971c74512b3e76d908c347f31624d9387d4e15"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
