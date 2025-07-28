cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.7"
  sha256 arm:   "f86c9c87d983d08c1d81d48f17f08e665f57921d78777d8cfff3bff157d65aa7", intel: "cc118284cc459b6983f0e78bf4ef9f2a709367e3b1569794dce5897ae3c1dd2f"

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
