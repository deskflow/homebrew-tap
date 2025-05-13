cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.21.2.228"
  sha256 arm:   "b4789254e84194d830e9520929d198826e66b6da96fdb640cddd93e3555b781f", intel: "29b58c03c867d46feeceb2fe0b41a77dfb27b8cc46a897066d4386d7c1c7ca00"

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
