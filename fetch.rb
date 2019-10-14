#!/usr/bin/env ruby

require 'open-uri'
require 'shellwords'
require 'fileutils'

# @param patches [Array<String>] URLs of the patch pages
def fetch(patches)
  (patches || []).each do |patch|
    puts "Fetching #{patch}"
    html = open(patch).read
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
  Dir['*.1'].each do |new|
    FileUtils.mv new, new[0...-2]
  end
end

# 1. Visit https://patchstorage.com/platform/mozaic/
# 2. Extract via browser console: $x('//*[@id="mason-layout"]/div/div/div/div/a').map(function(a){ return a.getAttribute('href') })
Dir.chdir(File.join(__dir__, 'Mozaic')) do
  fetch ["https://patchstorage.com/beatmarble-xy-for-any-drum-percussion/", "https://patchstorage.com/beatmarble-sd-for-snares-and-claps/", "https://patchstorage.com/beatmarble-hh-for-hihats/", "https://patchstorage.com/beatmarble-bd-for-bass-drums/", "https://patchstorage.com/midimarble-2/", "https://patchstorage.com/sustain-pedal/", "https://patchstorage.com/circus/", "https://patchstorage.com/random-2/", "https://patchstorage.com/midiplus-smartpad-unlocker/", "https://patchstorage.com/volca-drum-patch-assistant/", "https://patchstorage.com/complex-lfo-xy/", "https://patchstorage.com/mozaic-language-support-for-code-text-editors/", "https://patchstorage.com/pad-manager-include/", "https://patchstorage.com/midi-state-debugger/", "https://patchstorage.com/clusters/", "https://patchstorage.com/seq8-launchpad-step-sequencer/", "https://patchstorage.com/cc-to-roland-juno-106-sysex/", "https://patchstorage.com/flow/", "https://patchstorage.com/spectrum-parameter-randomizer/", "https://patchstorage.com/joc-p-lock-symphony/", "https://patchstorage.com/frazer/", "https://patchstorage.com/monty-hall-simulator/", "https://patchstorage.com/reslice-randomizer/", "https://patchstorage.com/envelope/", "https://patchstorage.com/phaseccmaker/", "https://patchstorage.com/message-filter/", "https://patchstorage.com/joc-cc-quantiser/", "https://patchstorage.com/mutemidi/", "https://patchstorage.com/joc-velocity-massage/", "https://patchstorage.com/midi-matrix-switch/", "https://patchstorage.com/sample-hold-2/", "https://patchstorage.com/midi-filter-and-transpose/", "https://patchstorage.com/cc-processor/", "https://patchstorage.com/chaos-lfo/", "https://patchstorage.com/midi-cc-randomizer-and-scenes/", "https://patchstorage.com/orchestra/", "https://patchstorage.com/copycat/", "https://patchstorage.com/simple-recorder-looper/", "https://patchstorage.com/zachteman/", "https://patchstorage.com/aftertouch-to-cc/", "https://patchstorage.com/chord-magic/", "https://patchstorage.com/block-repeating-notes/", "https://patchstorage.com/split-remap-rozeta-x0x-rhythm/", "https://patchstorage.com/fail-safe/", "https://patchstorage.com/toggle-channels-on-bar-divisions/", "https://patchstorage.com/scale-compendium/", "https://patchstorage.com/midi-cc-automatable-transposer-scaler-v1-0/", "https://patchstorage.com/velocity-randomizer/", "https://patchstorage.com/edrum-monitor/", "https://patchstorage.com/midi-turing-machine/", "https://patchstorage.com/metroplex/", "https://patchstorage.com/mws-boss2bull/", "https://patchstorage.com/simple-scaler/", "https://patchstorage.com/probability-gate/", "https://patchstorage.com/note-probability/", "https://patchstorage.com/probability-gate-sequencer/", "https://patchstorage.com/scenic-sequencer/", "https://patchstorage.com/round-robin/", "https://patchstorage.com/mutating-sequence-generator/", "https://patchstorage.com/double-tap-and-hold/", "https://patchstorage.com/jaymeter/", "https://patchstorage.com/jay-meter-velocity/", "https://patchstorage.com/relativeccv0-1/", "https://patchstorage.com/pulsesequence/", "https://patchstorage.com/midiq/", "https://patchstorage.com/polymono-midi-router/", "https://patchstorage.com/chord-delay/", "https://patchstorage.com/midi-adsr/", "https://patchstorage.com/the-chordulator/", "https://patchstorage.com/ms6-control-panel/", "https://patchstorage.com/infinity/", "https://patchstorage.com/minimalism-wizard/", "https://patchstorage.com/midi-morph-pad-2/", "https://patchstorage.com/emoji-pad/", "https://patchstorage.com/midimarble/", "https://patchstorage.com/multi-channel-midi-delay/", "https://patchstorage.com/ruismaker-loopers/", "https://patchstorage.com/reich-phasing/", "https://patchstorage.com/velocity-midi-echo/", "https://patchstorage.com/rhythmic-midi-echo/", "https://patchstorage.com/chordpeggio/", "https://patchstorage.com/strummer/"]
end