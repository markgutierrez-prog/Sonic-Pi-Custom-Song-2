# custom song 2 layout
use_bpm 110
use_synth :piano
use_octave -1


define :rightHand do
  beat1 = [:g5, :g4, :bb4, :db5]
  i = 0
  4.times do
    play beat1[i], release: 0.8, amp: 0.6
    i = i+1
    sleep 0.25
  end
  
  beat2= [:ab5, :c5, :f5, :ab5]
  e = 0
  4.times do
    play beat2[e], release: 0.8, amp: 0.6
    e = e+1
    sleep 0.25
  end
  
  beat3 = [:c6, :f5, :ab5, :c6]
  r = 0
  4.times do
    play beat3[r], release: 0.8, amp: 0.6
    r = r+1
    sleep 0.25
  end
  
  beat4 = [:eb6, :ab5, :c6, :eb6]
  g = 0
  4.times do
    play beat4[g], release: 0.8, amp: 0.6
    g = g+1
    sleep 0.25
  end
end

define :leftHand do
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


define :rightHand2 do
  beat1 = [:f4, :c5, :f5, :ab5]
  i = 0
  4.times do
    play beat1[i], release: 0.8, amp: 0.6
    i = i+1
    sleep 0.25
  end
  
  beat2= [:c6, :f5, :ab5, :c6]
  e = 0
  4.times do
    play beat2[e], release: 0.8, amp: 0.6
    e = e+1
    sleep 0.25
  end
  
  beat3 = [:eb6, :c6, :eb6, :g6]
  r = 0
  4.times do
    play beat3[r], release: 0.8, amp: 0.6
    r = r+1
    sleep 0.25
  end
  
  beat4 = [:g6, :eb6, :g6, :bb6]
  g = 0
  4.times do
    play beat4[g], release: 0.8, amp: 0.6
    g = g+1
    sleep 0.25
  end
end

define :leftHand2 do
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

with_fx :reverb, room: 0.8, mix: 0.6 do
  
  in_thread do
    rightHand2
  end
  leftHand2
  
  
  in_thread do
    rightHand
  end
  leftHand
  
end
