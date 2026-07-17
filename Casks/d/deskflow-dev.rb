cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.317"
  sha256 arm:   "655efd6c763483720c5bf21b42850570625bff81665c4012bd79459561706028", intel: "0ac4c9e5e928660cfd9d9c528a7c2436e6f983f4cfb93860e2415d7d2f9c123f"

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
