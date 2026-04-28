cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.168"
  sha256 arm:   "f8856381eb768ba1073992928de2ded21bc756c26463f4796db58b942a335728", intel: "b00f6b1e2ad65eb8d540fa62c0e05a933aac893c50215e6227a58bafbac29d61"

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
