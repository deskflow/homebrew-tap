cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.71"
  sha256 arm:   "181f89738404e2f7c417a1d14f091b4f9201d1fc87cfd895b2170576a97bbe9c", intel: "fe2f5439ca1c5740aff83b18bafd76da69835f9f72fa3d3b1a411f7cc1ea4d19"

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
