# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class CfnNag < Formula

  desc "Auditing tool for CloudFormation templates"
  homepage "https://github.com/stelligent/cfn_nag"
  url "https://rubygems.org/downloads/cfn-nag-0.4.19.gem"
  version "0.4.19"
  sha256 "b20c3b2a7a32abdfba263a95174b1b2f55480266f3f4d556bc746b611fe7e2e2"

  depends_on "ruby" if MacOS.version <= :sierra
  

  #s.add_runtime_dependency('cfn-model', '0.4.0')
  resource "cfn-model" do
    url "https://rubygems.org/gems/cfn-model-0.4.0-.gem"
    sha256 ""
  end

  #s.add_runtime_dependency('colorize', '0.8.1')
  resource "colorize" do
    url "https://rubygems.org/gems/colorize-0.8.1.gem"
    sha256 "0ba0c2a58232f9b706dc30621ea6aa6468eeea120eb6f1ccc400105b90c4798c"
  end

  #s.add_runtime_dependency('jmespath', '~> 1.3.1')
  resource "jmespath" do
    url "https://rubygems.org/gems/jmespath-1.4.0.gem"
    sha256 "ee5930ed833d3472fce31abf2f4a39852718e90b099dc2a6713234d600539cb4"
  end

  #s.add_runtime_dependency('logging', '~> 2.2.2')
  resource "logging" do
    url "https://rubygems.org/gems/logging-2.2.2.gem"
    sha256 "963359dbdab725a3320eab179017d20d5b9731d7148e1efa8432c184a48a461a"
  end

  #s.add_runtime_dependency('netaddr', '~> 1.5.1')
  resource "netaddr" do
    url "https://rubygems.org/gems/netaddr-2.0.3.gem"
    sha256 "e8e9b4c523d8597725bcaec133c2f7e588c4fe6f6695edfac271bd549f9bcbd5"
  end

  #s.add_runtime_dependency('trollop', '~> 2.1.2')
  resource "trollop" do
    url "https://rubygems.org/gems/trollop-2.9.9.gem"
    sha256 "e4da3b29c084af29dc0d802dbbba0231fc3ee855e5ef57680b6f8aa32d3d901c"
  end


  def install
    
    ENV["GEM_HOME"] = libexec
    ENV["GEM_VERSION"] = version
    
    #system "gem", "build", "cfn-nag.gemspec"
    system "gem", "install", "cfn-nag -v #{version}"
    
    bin.install Dir["bin/*"]
    #bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])

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
    #assert_equal version, shell_output("#{bin}/cfn_nag -v").strip
    assert_equal "0.4.19", shell_output("#{bin}/cfn_nag -v").strip

  end
end
