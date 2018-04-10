require "FileUtils"

class Bosh < Formula
  homepage "https://github.com/cloudfoundry/bosh-cli"

  v = "v3.0.1" # CI Managed
  # remove v from version number
  @@verNum = v.sub "v", "" 
  url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{@@verNum}-darwin-amd64"
  version v
  sha256 "" # CI Managed

  def install
    FileUtils.mv("bosh-cli-#{@@verNum}-darwin-amd64", "bosh")
    bin.install "bosh"
  end

  test do
    system "#{bin}/bosh", "--version"
  end
end