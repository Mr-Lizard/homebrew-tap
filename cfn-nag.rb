class CfnNag < Formula

  desc "Auditing tool for CloudFormation templates"
  homepage "https://github.com/stelligent/cfn_nag"
  url "https://github.com/stelligent/cfn_nag/tarball/v0.4.33"
  version "0.4.33"
  sha256 "8a430d2869adbfe8ba726f0aad5d595972980c858a07cc09632ec1d50618f3d8"

  
  depends_on "ruby" if MacOS.version <= :sierra
  
  resource "cfn-model" do
    url "https://rubygems.org/gems/cfn-model-0.4.0-.gem"
    sha256 ""
  end

  resource "colorize" do
    url "https://rubygems.org/gems/colorize-0.8.1.gem"
    sha256 "0ba0c2a58232f9b706dc30621ea6aa6468eeea120eb6f1ccc400105b90c4798c"
  end

  resource "jmespath" do
    url "https://rubygems.org/gems/jmespath-1.4.0.gem"
    sha256 "ee5930ed833d3472fce31abf2f4a39852718e90b099dc2a6713234d600539cb4"
  end

  resource "logging" do
    url "https://rubygems.org/gems/logging-2.2.2.gem"
    sha256 "963359dbdab725a3320eab179017d20d5b9731d7148e1efa8432c184a48a461a"
  end

  resource "netaddr" do
    url "https://rubygems.org/gems/netaddr-2.0.3.gem"
    sha256 "e8e9b4c523d8597725bcaec133c2f7e588c4fe6f6695edfac271bd549f9bcbd5"
  end

  resource "trollop" do
    url "https://rubygems.org/gems/trollop-2.9.9.gem"
    sha256 "e4da3b29c084af29dc0d802dbbba0231fc3ee855e5ef57680b6f8aa32d3d901c"
  end


  def install
    
    ENV["GEM_HOME"] = libexec
    ENV["GEM_VERSION"] = version
    
    system "gem", "build", "cfn-nag.gemspec"
    system "gem", "install", "cfn-nag"
    
    bin.install Dir["bin/*"]
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])

  end


  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test cfn_nag`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.

    assert_equal version, shell_output("#{bin}/cfn_nag -v").strip
    assert_equal version, shell_output("#{bin}/cfn_nag_scan -v").strip
    assert_equal version, shell_output("#{bin}/cfn_nag_rules -v").strip
    
  end

end
