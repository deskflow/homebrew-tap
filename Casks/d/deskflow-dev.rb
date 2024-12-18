cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.17.2.59"
  sha256 arm:   "042daa5009abf1192e10991fa144b94de46761720da7866de2d1cfbacf6777d4", intel: "718d001005ade234eaf98f0734e02d131c7c5b485d082422779677cd91388e01"

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
