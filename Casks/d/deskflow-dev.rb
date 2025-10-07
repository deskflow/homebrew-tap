cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.65"
  sha256 arm:   "8930ecdf698711ec29f2526d73d19d99a4f706cbbf566b4df336a92fee0b6177", intel: "e4e74498eb00e273e4ea769da34e3af520a6e8db610ecf28d24d4461961bf6d1"

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
