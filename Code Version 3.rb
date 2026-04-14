# custom song 2
#VERSION 3
use_bpm 120
use_synth :piano
use_octave -1

beats1 = [:g5, :g4, :bb4, :db5, :ab5, :c5, :f5, :ab5, :c6, :f5, :ab5, :c6, :eb6, :ab5, :c6, :eb6]

define :main1 do |beats1|
  i = 0
  16.times do
    play beats1[i], release: 0.8, amp: 0.6
    i = i+1
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

beats2 = [:f4, :c5, :f5, :ab5,:c6, :f5, :ab5, :c6,:eb6, :c6, :eb6, :g6,:g6, :eb6, :g6, :bb6]

define :main2 do |beats2|
  i = 0
  16.times do
    play beats2[i], release: 0.8, amp: 0.6
    i = i+1
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
  play_chord [:c3, :g3, :c4, :eb4], release: 4, amp: 0.6
  sleep 4
  
  play_chord [:ab2, :eb3, :ab3, :c4], release: 4, amp: 0.6
  sleep 4
  
  play_chord [:f2, :c3, :f3, :ab3], release: 4, amp: 0.6
  sleep 4
  
  play_chord [:g2, :d3, :g3, :b3], release: 4, amp: 0.6
  sleep 4
end

define :intro2 do
  list1 = [:c4, :eb4, :g4, :c5, :eb5, :c5, :g4, :eb4]
  i = 0
  
  play :c2, sustain: 2, release: 2, amp: 0.8
  8.times do
    play list1[i], release: 1.5, amp: 0.7
    i = i+1
    sleep 0.7
  end
  
  list2 = [:c4, :eb4, :ab4, :c5, :eb5, :c5, :ab4, :eb4]
  e = 0
  
  play :ab1, sustain: 2, release: 2, amp: 0.8
  8.times do
    play list2[e], release: 1.5, amp: 0.7
    e = e + 1
    sleep 0.7
  end
end

#SPLIT

define :outro do
  in_thread do
    use_synth :hollow
    volume = 1.5
    
    8.times do
      play_chord [:c3, :g3, :c4, :eb4], sustain: 3, release: 1, amp: volume
      sleep 4
      volume = volume - 0.18
    end
  end
  
  volume = 1.0
  use_synth :piano
  8.times do
    play :c5, amp: volume, release: 2
    sleep 0.5
    
    play :g4, amp: volume, release: 2
    sleep 0.5
    
    play :eb4, amp: volume, release: 2
    sleep 0.5
    
    play :c4, amp: volume, release: 2
    sleep 2.5
    volume = volume - 0.125
  end
  play_chord [:c2, :g2, :c3], sustain: 4, release: 6, amp: 0.1
end


with_fx :reverb, room: 0.8, mix: 0.6 do
  intro1
  intro2
  
  sleep 1
  
  in_thread do
    8.times do
      sample :bd_haus, amp: 0.5
      sleep 1
    end
  end
  
  in_thread do
    main2 beats2
  end
  secondary2
  
  in_thread do
    main1 beats1
  end
  secondary1
  
  outro
end
