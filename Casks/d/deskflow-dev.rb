cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.18.0.70"
  sha256 arm:   "a6d6f6c338c9f1f6b932c0f9cbd5f9a7ca0679e0440f6106dc88f192bee001d0", intel: "b4604e0415fcecd42588537fe8edc1d1e45c80662677f7a795e00fadb3868a57"

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
