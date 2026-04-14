# custom song 2
#VERSION 4
use_bpm 120
use_synth :piano
use_octave -1

i = 0
beats1 = [:g4, :bb4, :db5, :g5,
          :f5, :c5, :ab4, :f5,
          :c5, :eb5, :ab5, :c6,
          :ab4, :c5, :eb5, :g5]
e = 0
beats2 = [:g4, :bb4, :db5, :g5,
          :f5, :c5, :ab4, :f5,
          :eb5, :g5, :bb5, :g5,
          :c5, :ab4, :f4, :c5]
define :main1 do |beats1, beats2|
  16.times do
    play beats1[i], release: 0.6, amp: 0.6
    i = i+1
    sleep 0.25
  end
  16.times do
    play beats2[e], release: 0.6, amp: 0.6
    e = e+1
    sleep 0.25
  end
end

define :secondary1 do
  play_chord [:eb2, :eb3], release: 2.5
  sleep 0.75
  play_chord [:g3, :bb3, :db4], release: 2.5
  sleep 0.25
  
  play_chord [:f2, :f3], release: 2.5
  sleep 0.75
  play_chord [:ab3, :c4, :f4], release: 2.5
  sleep 0.25
  
  play_chord [:f2, :f3], release: 2.5
  sleep 0.75
  play_chord [:ab3, :c4, :f4], release: 2.5
  sleep 0.25
  
  play_chord [:ab2, :ab3], release: 2.5
  sleep 0.75
  play_chord [:c4, :eb4, :ab4], release: 2.5
  sleep 0.25
end

#SPLIT
define :transition do
  use_synth :piano
  
  play_chord [:c4, :eb4, :g4], release: 0.5, amp: 0.5
  sleep 0.75
  
  sample :drum_snare_soft, amp: 0.6
  sleep 0.25
end
#SPLIT

f = 0
beats1part2 = [:f4, :ab4, :c5, :f5,
               :c5, :ab4, :f4, :c5,
               :eb5, :g5, :c6, :g5,
               :eb5, :c5, :g4, :eb5]
g = 0
beats2part2 = [:f4, :ab4, :c5, :f5,
               :c5, :ab4, :f4, :c5,
               :g5, :bb5, :g5, :eb5,
               :c5, :g4, :f4, :c5]
define :main2 do |beats1part2, beats2part2|
  16.times do
    play beats1part2[f], release: 0.6, amp: 0.6
    f = f+1
    sleep 0.25
  end
  16.times do
    play beats2part2[g], release: 0.6, amp: 0.6
    g = g+1
    sleep 0.25
  end
end

define :secondary2 do
  play_chord [:f2, :f3], release: 2.5
  sleep 0.75
  play_chord [:ab3, :c4, :f4], release: 2.5
  sleep 0.25
  
  play_chord [:f2, :f3], release: 2.5
  sleep 0.75
  play_chord [:ab3, :c4, :f4], release: 2.5
  sleep 0.25
  
  play_chord [:c2, :c3], release: 2.5
  sleep 0.75
  play_chord [:g3, :c4, :eb4], release: 2.5
  sleep 0.25
  
  play_chord [:c2, :c3], release: 2.5
  sleep 0.75
  play_chord [:g3, :c4, :eb4], release: 2.5
  sleep 0.25
end

#SPLIT

define :intro1 do
  play_chord [:c3, :g3, :c4, :eb4], release: 4, amp: 0.9
  sleep 4
  
  play_chord [:c4, :eb4, :ab4, :c5], release: 4, amp: 0.9
  sleep 4
  
  play_chord [:c4, :f4, :ab4, :c5], release: 4, amp: 0.9
  sleep 4
  
  play_chord [:d4, :g4, :b4, :d5], release: 4, amp: 0.9
  sleep 4
end

define :intro2 do
  use_synth :piano
  
  list1 = [:c4, :eb4, :g4, :c5, :eb5, :c5, :g4, :eb4]
  i = 0
  play :c3, sustain: 3.5, release: 0.5, amp: 0.8
  8.times do
    play list1[i], release: 0.4, amp: 0.7
    i = i+1
    sleep 0.5
  end
  
  list2 = [:c4, :eb4, :ab4, :c5, :eb5, :c5, :ab4, :eb4]
  e = 0
  play :ab3, sustain: 3.5, release: 0.5, amp: 0.8
  8.times do
    play list2[e], release: 0.4, amp: 0.7
    e = e+1
    sleep 0.5
  end
end

#SPLIT

define :outro do
  in_thread do
    use_synth :hollow
    volume = 1
    3.times do
      play_chord [:c3, :g3, :c4, :eb4], sustain: 3, release: 1, amp: volume
      sleep 4
      volume = volume - 0.25
    end
  end
  
  volume = 1
  use_synth :piano
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
  play_chord [:c4, :g2, :c3], sustain: 4, release: 6, amp: 0.1
end


with_fx :reverb, room: 0.8, mix: 0.6 do
  intro1
  intro2
  
  play_chord [:d4, :g4, :b4, :d5], release: 4, amp: 0.75
  
  in_thread do
    8.times do
      sample :bd_haus, amp: 0.5
      sleep 1
    end
  end
  
  in_thread do
    sleep 0.5
    main2 beats1part2, beats2part2
  end
  2.times do
    secondary2
  end
  
  sleep 0.5
  transition
  
  in_thread do
    main1 beats1, beats2
  end
  2.times do
    secondary1
  end
  sleep 0.5
  
  transition
  
  outro
end
