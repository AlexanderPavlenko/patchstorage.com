#!/usr/bin/env ruby

require 'open-uri'
require 'shellwords'
require 'fileutils'
require 'json'

# @param patches [Array<String>] URLs of the patch pages
def fetch(patches)
  (patches || []).each do |patch|
    puts "Fetching #{patch}"
    html = URI.open(patch).read
    url  = URI.extract(html.match(%r{a id="DownloadPatch".+?</a>})[0])[0]
    if url.nil?
      puts "Failed to parse page"
      next
    end
    puts "Downloading #{url}"
    system %(wget -q #{url.shellescape} || echo Failed to download patch)
  rescue => ex
    $stderr.puts ex.inspect
  end  
  cleanup
end

def cleanup
  Dir['*.1'].each do |new|
    FileUtils.mv new, new[0...-2]
  end
  Dir['*.zip'].each do |zip|
    name = File.basename(zip, '.zip')
    system %(rm -rf #{name.shellescape})
    system %(unzip #{zip.shellescape} -d #{name.shellescape})
    system %(rm #{zip.shellescape})
  end
  similar = Dir['*'].group_by { |item| item[..8].downcase }.select { |k, v| v.size > 1 }.flat_map(&:last)
  puts "Maybe some old versions to remove:", similar.sort_by(&:downcase).join("\n")
end

# 1. Visit https://patchstorage.com/platform/mozaic/ and scroll to the end
# 2. Extract via browser console: copy($x('//*[@id="mason-layout"]/div/div/div/div/a').map(function(a){ return a.getAttribute('href') }))
Dir.chdir(File.join(__dir__, 'Mozaic')) do
  File.open('index.json') do |index|
    fetch JSON.load(index)
    cleanup
  end
end
