#!/usr/bin/env ruby

require 'open-uri'
require 'shellwords'
require 'fileutils'
require 'json'

# @param dir [String] patches category
def fetch_all(dir)
  Dir.chdir(File.join(__dir__, dir)) do
    File.open('index.json') do |index|
      fetch JSON.load(index)
      cleanup
    end
  end
end

# @param patches [Array<String>] URLs of the patch pages
def fetch(patches)
  (patches || []).each do |patch|
    puts "Fetching #{patch}"
    html = URI.open(patch).read
    url  = URI.extract(html.match(%r{href="https://patchstorage.com/wp-content/uploads/.+?" download>})[0])[0]
    if url.nil?
      puts "Failed to parse page"
      next
    end
    puts "Downloading #{url}"
    system %(wget -q #{url.shellescape} || echo Failed to download patch)
  rescue => ex
    $stderr.puts ex.inspect
  end
end

def cleanup
  Dir['*.1'].each do |new|
    FileUtils.mv new, new[0...-2]
  end
  Dir['*.mrk.zip'].each do |zip|
    system %(unzip #{zip.shellescape} -d #{File.dirname(zip).shellescape})
    system %(rm #{zip.shellescape})
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

# holmium: visit https://patchstorage.com/author/holmium/ and scroll to the end
# Mozaic: visit https://patchstorage.com/platform/mozaic/ and scroll to the end
#
# index.json: extract via browser console
# copy($x('//*[@id="mason-layout"]/div/div/div/div/a').map(function(a){ return a.getAttribute('href') }))

#fetch_all 'holmium'

fetch_all 'Mozaic'
# omitted:
# "https://patchstorage.com/gauss-8-track/" – too big
