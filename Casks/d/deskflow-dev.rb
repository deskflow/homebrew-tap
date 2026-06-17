cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.251"
  sha256 arm:   "a6d34497ce20df44da0229b7ebe00255cb8854c8e856b166ece845563f88cfef", intel: "7b32251d5dd6b0e27616073b6884e7284aff824f10a4127f8f95b00f6a0e6a90"

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
