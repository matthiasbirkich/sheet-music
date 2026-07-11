\version "2.22.2"

\header {
  title = "Haiku"
  subtitle = "Resonanzmelodie - Bordun A = 110 Hz · Naturtonreihe vs 12-TET"
  composer = "Werner Rizzi"
  arranger = "Vokalise"
  tagline = ##f
}

global = {
  \cadenzaOn
  \tempo 4 = 66
}

% ---------------------------------------------------------
% Resonanztonfolge:
% 8 – 12 – 16 – 14 – 12 – 11 – 12 – 10 – 11 –
% 13 – 14 – 12 – 10 – 11 – 9 – 7 – 8
%
% WICHTIG:
% Die Resonanztonnummer ist die primaere Information.
% Die Centwerte vergleichen den exakten Naturton mit 12-TET.
% Sie sind KEINE Aufforderung, den Ton vom Kehlkopf aus zu korrigieren.
%
% RT 10 wird harmonisch als Cis -14 c bezeichnet,
% nicht als C +86 c.
% RT 13 wird als Fis -59 c bezeichnet.
%
% Die MIDI-Wiedergabe bleibt in dieser robusten Hacklily-Fassung
% gleichstufig temperiert. Gesungen wird aus der Resonanz des Borduns.
% ---------------------------------------------------------

melody = \relative c'' {
  \global
  \clef "treble^8"

  a2^\markup   { \bold "8"  }
  e'4^\markup  { \bold "12" }
  a4^\markup   { \bold "16" }
  g2^\markup   { \bold "14" }
  e2^\markup   { \bold "12" }
  d2^\markup   { \bold "11" }
  e4^\markup   { \bold "12" }
  cis4^\markup { \bold "10" }
  d4^\markup   { \bold "11" }

  \bar ""
  \break

  fis4^\markup { \bold "13" }
  g2^\markup   { \bold "14" }
  e2^\markup   { \bold "12" }
  cis4^\markup { \bold "10" }
  d4^\markup   { \bold "11" }
  b2.^\markup  { \bold "9"  }
  g2^\markup   { \bold "7"  }
  a1^\markup   { \bold "8"  }

  \bar "|."
}

toneNames = \lyricmode {
  "A5" "E6" "A6" "G↓6" "E6" "D↑6" "E6" "Cis↓6" "D↑6"
  "Fis↓6" "G↓6" "E6" "Cis↓6" "D↑6" "H5" "G↓5" "A5"
}

vowels = \lyricmode {
  "O–A" "E–I" "I" "E–I" "E–I" "Ö–E" "E–I" "Ö–E" "Ö–E"
  "Ö–E" "E–I" "E–I" "Ö–E" "Ö–E" "A–Ö" "A–Ö" "O–A"
}

symbols = \lyricmode {
  "◑→" "○↑" "○↑" "○↑" "○↑" "◔↗" "○↑" "◔↗" "◔↗"
  "◔↗" "○↑" "○↑" "◔↗" "◔↗" "◑↗" "◑↗" "◑→"
}

centValues = \lyricmode {
  "0 c" "+2 c" "0 c" "−31 c" "+2 c" "+51 c" "+2 c" "−14 c" "+51 c"
  "−59 c" "−31 c" "+2 c" "−14 c" "+51 c" "+4 c" "−31 c" "0 c"
}

% Gesamtdauer: 29 Viertelschlaege
droneA = \relative c {
  \global
  \clef bass
  a1~ a1~ a1~ a1~ a1~ a1~ a1~ a4
  \bar "|."
}

\score {
  \new StaffGroup <<

    \new Staff \with {
      instrumentName = "Resonanz"
      midiInstrument = "flute"
      midiMinimumVolume = #0.80
      midiMaximumVolume = #1.00
    } <<
      \new Voice = "melodyVoice" { \melody }
    >>

    \new Lyrics \lyricsto "melodyVoice" { \toneNames }
    \new Lyrics \lyricsto "melodyVoice" { \vowels }
    \new Lyrics \lyricsto "melodyVoice" { \symbols }
    \new Lyrics \lyricsto "melodyVoice" { \centValues }

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

    \context {
      \Lyrics
      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'((basic-distance . 2.2)
           (minimum-distance . 1.5)
           (padding . 0.8)
           (stretchability . 0))
    }
  }

  \midi { }
}
