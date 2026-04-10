# custom song 2
#VERSION 2
use_bpm 110
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
in_thread do
  10.times do
    sample :bd_haus, amp: 0.7
    sleep 1
  end
end
with_fx :reverb, room: 0.8, mix: 0.6 do
  in_thread do
    main2 beats2
  end
  secondary2
  
  in_thread do
    main1 beats1
  end
  secondary1
end
#example from class how to fade in/out notes
=begin
play :c2, amp: 0.5
sleep 0.25

play :e2, amp: 1
sleep 0.25

play :g2, amp: 1.5
sleep 0.25

play :b2, amp: 2
sleep 0.25

play :c3, amp: 2.5
sleep 0.25

play :b2, amp: 3
sleep 0.25

play :g2, amp: 3.5
sleep 0.25

play :e2, amp: 4
sleep 0.25
=end
#sample example
=begin

print(sample_duration :loop_amen_full)

#’0’ represents the beginning; ‘1’ represents the end (of your song)
#the two lines below play the full sample from start to end
sample :loop_amen_full, start: 0, finish: 1
sleep 6.85

#you can break your sample up into 4 parts (or as many as you want)
sample :loop_amen_full, start: 0, finish: 0.25, amp: 1
sleep 6.85/4

sample :loop_amen_full, start: 0.25, finish: 0.50, amp: 2
sleep 6.85/4

sample :loop_amen_full, start: 0.50, finish: 0.75, amp: 3
sleep 6.85/4

sample :loop_amen_full, start: 0.75, finish: 1, amp: 4
sleep 6.85/4
=end
