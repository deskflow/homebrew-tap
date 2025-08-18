cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.122"
  sha256 arm:   "fb66634d0e84be66ac008f7916a0ec79d270e14dea447a229419a636aad07803", intel: "524cde16a09e970a1f046d2a5b9673870a632afebc1bd149c744186a1fe8cd1a"

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
