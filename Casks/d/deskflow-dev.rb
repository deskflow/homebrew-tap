cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.395"
  sha256 arm:   "54e566e8bc9fff75dc278fdb082e1cf2eb65da330df2e1e4abf30d6010dd4d51", intel: "43fd465e234c4addec5eb7c1764e70818fe7c8891eae1585857b6e7c6c1d62e9"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
