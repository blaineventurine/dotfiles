#!/usr/bin/env ruby

FORBIDDEN = [
  /\bconsole\.log\b/,
  /\bconsole\.debug\b/,
  /\bbinding\.irb\b/,
  /\bbinding\.pry\b/
]

full_diff = `git diff --cached --`.force_encoding('ASCII-8BIT')
full_diff.scan(%r{^\+\+\+ b/(.+)\n@@.*\n([\s\S]*?)(?:^diff|\z)}).each do |file, diff|
  added = diff.split("\n").select { |x| x.start_with?('+') }.join("\n")
  next unless FORBIDDEN.any? { |re| added.match(re) }

  puts %(Git hook forbids adding "#{Regexp.last_match(1) || Regexp.last_match(0)}" to #{file})
  puts 'To commit anyway, use --no-verify'
  exit 1
end
