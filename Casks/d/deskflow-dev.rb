cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.123"
  sha256 arm:   "1ded05a449caf0040a32c6243208f8c8a2adc04af1dd792f916b85def67a92d8", intel: "07a19efd4993f0f6fd7f5ebaf306ae3bebeb4ee802973e0f9992e2a2ecbf2b4a"

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
