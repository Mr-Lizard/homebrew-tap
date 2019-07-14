#!/usr/bin/ruby 

test do
  puts "testing"
  assert_equal "0.4.15", shell_output("#{bin}/cfn_nag -v").strip
end


