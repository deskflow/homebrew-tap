cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.11"
  sha256 arm:   "bd000febdb1716dc54f90b15e1948cc49050bf9a6f1ff7ba5489c2c771ac38f9", intel: "5a2136c7fe23df4d048af3661b11b9f497830ff8993a6e29353b67573cbfec73"

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
