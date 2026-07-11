\version "2.22.2"

\header {
  title = "Haiku – Resonanzmelodie"
  subtitle = "Melodie über Bordun A = 110 Hz · freie archaische Form"
  composer = "Werner Rizzi"
  arranger = "Resonanzton-Fassung nach Gesangsaufnahme"
  tagline = ##f
}

% ---------------------------------------------------------
% Mikrotonale Note mit Resonanztonnummer
% ---------------------------------------------------------

#(define (microResNote oct step cents dur-log dot-count rt)
   (make-music
    'EventChord
    'elements
    (list
     (make-music
      'NoteEvent
      'duration (ly:make-duration dur-log dot-count)
      'pitch (ly:make-pitch oct step (/ cents 200)))
     (make-music
      'TextScriptEvent
      'direction UP
      'text
      (markup
       #:bold
       #:fontsize 1
       (number->string rt))))))

% ---------------------------------------------------------
% Resonanzmelodie
%
% RT 10 wird als C↑ +86 c notiert, nicht als Cis −14 c.
% RT 11 wird als D↑ +51 c notiert.
% RT 14 wird als G↓ −31 c notiert.
% Die klingende Tonhöhe bleibt exakt die Naturtonstufe.
% ---------------------------------------------------------

melody = {
  \clef "treble^8"
  \cadenzaOn
  \tempo 4 = 66

  #(microResNote 1 5   0 1 0  8)   % A5
  #(microResNote 2 2   2 2 0 12)   % E6
  #(microResNote 2 5   0 2 0 16)   % A6
  #(microResNote 2 4 -31 1 0 14)   % G6 down
  #(microResNote 2 2   2 1 0 12)   % E6
  #(microResNote 2 1  51 1 0 11)   % D6 up
  #(microResNote 2 2   2 2 0 12)   % E6
  #(microResNote 2 0  86 2 0 10)   % C6 up = 1100 Hz
  #(microResNote 2 1  51 2 0 11)   % D6 up
  #(microResNote 2 4 -31 2 0 14)   % G6 down
  #(microResNote 2 4  88 1 0 15)   % G6 strongly up = Gis6 -12 c
  #(microResNote 2 2   2 1 0 12)   % E6
  #(microResNote 2 0  86 2 0 10)   % C6 up
  #(microResNote 2 1  51 2 0 11)   % D6 up
  #(microResNote 1 6   4 1 1  9)   % H5
  #(microResNote 1 4 -31 1 0  7)   % G5 down
  #(microResNote 1 5   0 0 0  8)   % A5
  #(microResNote 1 5   0 0 0  8)   % A5

  \bar "|"
}

vowels = \lyricmode {
  "O–A"
  "E–I"
  "I"
  "E–I"
  "E–I"
  "Ö–E"
  "E–I"
  "Ö–E"
  "Ö–E"
  "E–I"
  "I"
  "E–I"
  "Ö–E"
  "Ö–E"
  "A–Ö"
  "A–Ö"
  "O–A"
}

symbols = \lyricmode {
  "◑→"
  "○↑"
  "○↑"
  "○↑"
  "○↑"
  "◔↗"
  "○↑"
  "◔↗"
  "◔↗"
  "○↑"
  "○↑"
  "○↑"
  "◔↗"
  "◔↗"
  "◑↗"
  "◑↗"
  "◑→"
}

cents = \lyricmode {
  "0 c"
  "+2 c"
  "0 c"
  "−31 c"
  "+2 c"
  "+51 c"
  "+2 c"
  "+86 c"
  "+51 c"
  "−31 c"
  "+88 c"
  "+2 c"
  "+86 c"
  "+51 c"
  "+4 c"
  "−31 c"
  "0 c"
}

droneA = \absolute {
  \clef bass
  \cadenzaOn

  a,\breve~
  a,\breve~
  a,\breve~
  a,\breve~
  a,1

  \bar "|"
}

\score {
  \new StaffGroup <<

    \new Staff \with {
      instrumentName = "Resonanz"
      midiInstrument = "flute"
      midiMinimumVolume = #0.80
      midiMaximumVolume = #1.00
    } <<
      \new Voice = "melody" {
        \melody
      }
    >>

    \new Lyrics = "vowelLine"
    \with {
      \override LyricText.font-size = #1
      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'((basic-distance . 2.0)
           (minimum-distance . 1.5)
           (padding . 0.8)
           (stretchability . 0))
    }
    \lyricsto "melody" {
      \vowels
    }

    \new Lyrics = "symbolLine"
    \with {
      \override LyricText.font-size = #1
      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'((basic-distance . 1.5)
           (minimum-distance . 1.0)
           (padding . 0.5)
           (stretchability . 0))
    }
    \lyricsto "melody" {
      \symbols
    }

    \new Lyrics = "centLine"
    \with {
      \override LyricText.font-size = #-1
      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'((basic-distance . 3.5)
           (minimum-distance . 2.5)
           (padding . 1.5)
           (stretchability . 0))
    }
    \lyricsto "melody" {
      \cents
    }

    \new Staff \with {
      instrumentName = "Bordun A"
      midiInstrument = "voice oohs"
      midiMinimumVolume = #0.20
      midiMaximumVolume = #0.40
    } {
      \droneA
    }

  >>

  \layout {
    indent = 25\mm

    \context {
      \Score
      \override TextScript.staff-padding = #2.0
      \override SpacingSpanner.common-shortest-duration =
        #(ly:make-moment 1/8)
    }
  }

  \midi { }
}
