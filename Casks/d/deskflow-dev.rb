cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.378"
  sha256 arm:   "c7df1b67264fac47f214d03dc371e634a286fc7e604ae433b78e2917bdb19569", intel: "38c2a6dc46b5c1583520aae4eef202b66a592c3d3e41d48b089ab7a5ad127e5d"

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
