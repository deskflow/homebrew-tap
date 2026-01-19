cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.173"
  sha256 arm:   "61701acf524e67be1f009f9c03039b6010545d5ebdd20ef908668db77b9b6d1f", intel: "0e1869968ffae15f837e4ebc04887b7cad03669769ae8921b1b6cf663abf1199"

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
