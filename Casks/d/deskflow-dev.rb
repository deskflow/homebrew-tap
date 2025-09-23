cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.13"
  sha256 arm:   "e81976d6fcb391e1a1253b4dd226f4fde4ae64b621773fac9683e5bdffdd6fef", intel: "a6242514f5069849d8cbc44c2fbd08ee14008c7e2d1cc84d7484a1b16f9e594b"

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
