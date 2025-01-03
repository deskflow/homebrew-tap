cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.12"
  sha256 arm:   "0de2e6bf0ba5dedbf5ad85fd84e88198bf32540b751d84739314ec87b0d7ee46", intel: "853c6e12da7484dce1c6163c17eb86adae02db1660161084021fe7fb38b3a0b7"

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
