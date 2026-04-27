#FINAL MERGED SONGS
# CUSTOM SONG 1

use_bpm 60
clip = "C:/Users/mg730/Documents/Audacity/DeathByGlamour.mp3"
cliplength = sample_duration "C:/Users/mg730/Documents/Audacity/DeathByGlamour.mp3"
set :done, false

live_loop :clipped do
  t = tick
  if t == 2
    use_synth :piano
    play :fs4; sleep 0.2
    play :g4;  sleep 0.2
    play :fs4; sleep 0.2
    play :b4;  sleep 0.2
    play :a4;  sleep 0.2
    play :e4;  sleep 0.2
    play :d4;  sleep 0.2
    play :c4;  sleep 0.2
    play :a3;  sleep 0.2
    play :g3;  sleep 0.2
    play :e3;  sleep 0.2
    set :done, true
    cue :song_transition
    stop
  end
  sample clip, amp: 1.25
  sleep cliplength
  use_synth :piano
  play :a4, sustain: 1
  play :e4, sustain: 1
  play :cs4, sustain: 1
  sleep 1
end

sleep 4
live_loop :layera do
  stop if get(:done)
  sample :bd_haus, amp: 0.7
  sleep 0.5
  stop if get(:done)
end

sleep 2
live_loop :layerb do
  stop if get(:done)
  use_synth :piano
  play :fs4, sustain: 1
  play :cs4, sustain: 1
  play :a3,  sustain: 1
  sleep 2
  stop if get(:done)
  play :g4,  sustain: 1
  play :d4,  sustain: 1
  play :b3,  sustain: 1
  sleep 2
  stop if get(:done)
  play :a4,  sustain: 1
  play :e4,  sustain: 1
  play :cs4, sustain: 1
  sleep 2
  stop if get(:done)
  play :g4,  sustain: 1
  play :d4,  sustain: 1
  play :b3,  sustain: 1
  sleep 2
end

# WAIT FOR SONG 1 TO END

sync :song_transition


# TRANSITION

transitionSound = "C:/Users/mg730/Documents/Audacity/finishedTransition.mp3"
sample transitionSound
sleep sample_duration transitionSound
sleep 2

# CUSTOM SONG 2

use_bpm 120
use_octave -1

death_sound = "C:/Users/mg730/Downloads/Undertale Death Sound Effect.mp3"

beats1 = [:g4, :bb4, :db5, :g5,
          :f5, :c5, :ab4, :f5,
          :c5, :eb5, :ab5, :c6,
          :ab4, :c5, :eb5, :g5]

beats2 = [:g4, :bb4, :db5, :g5,
          :f5, :c5, :ab4, :f5,
          :eb5, :g5, :bb5, :g5,
          :c5, :ab4, :f4, :c5]

beats3 = [:f4, :ab4, :c5, :f5,
          :c5, :ab4, :f4, :c5,
          :eb5, :g5, :c6, :g5,
          :eb5, :c5, :g4, :eb5]

beats4 = [:f4, :ab4, :c5, :f5,
          :c5, :ab4, :f4, :c5,
          :g5, :bb5, :g5, :eb5,
          :c5, :g4, :f4, :c5]

define :mainplay do |a, b|
  use_synth :piano
  index = 0
  a.each do
    play a[index], release: 0.6, amp: 0.6
    index = index + 1
    sleep 0.25
  end
  index = 0
  b.each do
    play b[index], release: 0.6, amp: 0.6  # fixed: was a[index]
    index = index + 1
    sleep 0.25
  end
end

define :secondary1 do
  use_synth :piano
  play_chord [:eb2, :eb3], release: 2.5
  sleep 0.75
  play_chord [:g3, :bb3, :db4], release: 2.5
  sleep 0.25
  2.times do
    play_chord [:f2, :f3], release: 2.5
    sleep 0.75
    play_chord [:ab3, :c4, :f4], release: 2.5
    sleep 0.25
  end
  play_chord [:ab2, :ab3], release: 2.5
  sleep 0.75
  play_chord [:c4, :eb4, :ab4], release: 2.5
  sleep 0.25
end

define :secondary2 do
  use_synth :piano
  2.times do
    play_chord [:f2, :f3], release: 2.5
    sleep 0.75
    play_chord [:ab3, :c4, :f4], release: 2.5
    sleep 0.25
  end
  2.times do
    play_chord [:c2, :c3], release: 2.5
    sleep 0.75
    play_chord [:g3, :c4, :eb4], release: 2.5
    sleep 0.25
  end
end

define :transition do
  use_synth :piano
  play_chord [:c4, :eb4, :g4], release: 0.5, amp: 0.5
  sleep 0.75
  sample :drum_snare_soft, amp: 0.6
  sleep 0.25
end

define :introfunction1 do
  use_synth :piano
  play_chord [:c3, :g3, :c4, :eb4], release: 4, amp: 0.9
  sleep 4
  play_chord [:c4, :eb4, :ab4, :c5], release: 4, amp: 0.9
  sleep 4
  play_chord [:c4, :f4, :ab4, :c5], release: 4, amp: 0.9
  sleep 4
  play_chord [:d4, :g4, :b4, :d5], release: 4, amp: 0.9
  sleep 4
end

intro1 = [:c4, :eb4, :g4, :c5, :eb5, :c5, :g4, :eb4]
intro2 = [:c4, :eb4, :ab4, :c5, :eb5, :c5, :ab4, :eb4]

define :introfunction2 do |x, y|
  use_synth :piano
  index = 0
  play :c3, sustain: 3.5, release: 0.5, amp: 0.8
  x.each do
    play x[index], release: 0.4, amp: 0.7
    index = index + 1
    sleep 0.5
  end
  index = 0
  play :ab3, sustain: 3.5, release: 0.5, amp: 0.8
  y.each do
    play y[index], release: 0.4, amp: 0.7
    index = index + 1
    sleep 0.5
  end
end

define :outrofunction do
  in_thread do
    use_synth :hollow
    volume = 1
    3.times do
      play_chord [:c3, :g3, :c4, :eb4], sustain: 3, release: 1, amp: volume
      sleep 4
      volume = volume - 0.25
    end
  end
  use_synth :piano
  volume = 1
  4.times do
    play :c5, amp: volume, release: 2
    sleep 0.5
    play :g4, amp: volume, release: 2
    sleep 0.5
    play :eb4, amp: volume, release: 2
    sleep 0.5
    play :c4, amp: volume, release: 2
    sleep 2.5
    volume = volume - 0.25
  end
  play_chord [:c4, :g2, :c3], sustain: 4, release: 6, amp: 0.3
end

with_fx :reverb, room: 0.8, mix: 0.6 do
  introfunction1
  introfunction2 intro1, intro2
  
  use_synth :piano
  play_chord [:d4, :g4, :b4, :d5], release: 4, amp: 0.75
  
  in_thread do
    8.times do
      sample :bd_haus, amp: 0.5
      sleep 1
    end
  end
  
  in_thread do
    sleep 0.5
    mainplay beats3, beats4
  end
  2.times do
    secondary2
  end
  
  sleep 1
  transition
  
  in_thread do
    mainplay beats1, beats2
  end
  2.times do
    secondary1
  end
  
  sleep 1
  transition
  
  outrofunction
  sample death_sound
end
