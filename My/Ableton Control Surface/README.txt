Drambo as Ableton Control Surface

Featuring MIDI Rack with:
- Macro controls
- Macro bank selection
- v1 uses the usual Absolute mode (https://www.ableton.com/en/manual/midi-and-key-remote-control/#takeover-mode)
- v2 uses the Relative (lin. 2's Comp.) mode (https://www.ableton.com/en/manual/midi-and-key-remote-control/#mapping-to-relative-midi-controllers), similar to endless encoders on some hardware controllers
- Built-in pads (C7...D#8) are mapped as Drum Rack pads

UserConfiguration.txt belongs to the Ableton Preferences folder / User Remote Scripts / Drambo(1|2) (https://help.ableton.com/hc/en-us/articles/206240184)
Set Ableton's MIDI settings: "Control Surface: Drambo2", "Input: iPad", "Output: None".
See "Audio MIDI Setup" macOS utility to enable IDAM.

Disconnect Drambo track's MIDI output (right bottom corner) if pads trigger multiple notes.
Set Drambo track's "MIDI input (external) / Receive MIDI" setting to Never (or "Input" to non-All) if controls change by itself due to a MIDI feedback loop.

In case SysEx from IDAM is needed as well, it seems Ableton 11 ignores SysEx from the Control Surface input. A workaround is to copy the MIDI stream from the IDAM to a virtual IAC bus (via Reaper or whatever) and set this IAC bus as the Control Surface input instead of IDAM.