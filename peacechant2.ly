\version "2.22.2"

\header {
  title = "Ya Salam a Dunya"
  subtitle = "Peace Chant · Workshop-Fassung"
  composer = "Senegal · mündlich überliefert"
  arranger = ""
  tagline = ##f
}

global = {
  \key b \minor
  \time 4/4
  \tempo 4 = 68
}

harmonies = \chordmode {
  b1:m | b1:m | b1:m | b1:m |
  e1:m | fis1 | b1:m |
}

melody = \relative c' {
  \global
  \clef "treble_8"

  b2.\p cis8 a |
  b2. fis8 a |
  fis2. e8 d |
  fis2. b,8 fis' |

  e4 fis8 d cis4~ cis4~ |
  cis4 e8 e d4 cis8 cis |
  b4~ |
  b2. \bar "|."
}

text = \lyricmode {
  He __ e -- e
  e __ e -- e
  e __ e -- e
  e __ o -- o
  o o -- o o __
  Ya sa -- lam a dun -- ya
  __
}

\score {
  <<
    \new ChordNames { \harmonies }

    \new Staff \with {
      instrumentName = "SATB"
      midiInstrument = "voice oohs"
    } <<
      \new Voice = "peace" { \melody }
    >>

    \new Lyrics \lyricsto "peace" { \text }
  >>

  \layout {
    indent = 18\mm
    \context {
      \Score
      \override SpacingSpanner.common-shortest-duration =
        #(ly:make-moment 1/8)
    }
  }
}

\score {
  <<
    \new Staff {
      \set Staff.midiInstrument = "voice oohs"
      \melody
    }
  >>
  \midi { }
}
