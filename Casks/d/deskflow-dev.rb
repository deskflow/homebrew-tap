cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.35"
  sha256 arm:   "29b146af4cc2eaef9d4a4d0a659ff4abbcf8e80bc9208bc98f27b02684e940e8", intel: "d800cecb3bbe236055a9d2e5eca5c207f2fdd1c05de79e3aee3a20a01eafac60"

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
