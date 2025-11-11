cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.332"
  sha256 arm:   "de44773cf863324b28de34ad2d80f3809cad7258b6d11d9a5bacd1b1ab25b256", intel: "d2b2a89db9dcdbb2eed593feb05ff302715c6bc995da63e298f426c450dcd2a3"

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
