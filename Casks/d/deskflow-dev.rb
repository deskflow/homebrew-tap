cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.235"
  sha256 arm:   "addd7ee4749f774c7c3830b8889884256fd9e04deaa3448c8cd7574b9456456f", intel: "05dcf40c548d1b39212699b2a104ae70e4a453cf114ca90af06d6b70befcc617"

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
