cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.182"
  sha256 arm:   "a79aab6a4bae408c7c67f012cd4430df97fe342b562163fb70f0ecbd22aa4630", intel: "909f9244fee6a52111635833d0a121f6737b381ca6711e08f99055fcadf38062"

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
