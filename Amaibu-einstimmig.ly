\version "2.22.2"
\language "deutsch"

\header {
  title = "Amaibu"
  subtitle = "Kanon zu 2–8 Stimmen · Stimmeinsatz alle 2/4"
  composer = "Baka-Pygmäen, trad. – aus der Sammlung N. Messomo"
  tagline = ##f
}

global = {
  \time 4/4
  \key c \major
  \tempo 4 = 72
}

melody = \relative c' {
  \global
  \clef treble

  \partial 4
  c8 c8 |

  c'4 b4 g4. f8 |
  e8 c8 c2 c8 c8 |
  b'4 g4 f4. e8 |
  c2. \bar "|."
}

% Stimme 1 beginnt mit dem Auftakt.
% Die Stimmen 2–8 setzen jeweils nach weiteren 2/4 ein.
entryNumbers = {
  \partial 4
  s4^\markup \bold "1"

  s4
  s2^\markup \bold "2"
  s2^\markup \bold "3"
  s2^\markup \bold "4"
  s2^\markup \bold "5"
  s2^\markup \bold "6"
  s2^\markup \bold "7"
  s2^\markup \bold "8"
}

lyricsAmaibu = \lyricmode {
  A -- ma -- i -- bu
  o -- i -- e -- i -- i
  a -- ma -- i -- bu
  o -- i -- ei
}

\score {
  <<
    \new Staff \with {
      instrumentName = "SATB"
      midiInstrument = "voice oohs"
    } <<
      \new Voice = "melodyVoice" {
        \voiceOne
        \melody
      }

      \new Voice {
        \voiceTwo
        \entryNumbers
      }
    >>

    \new Lyrics \lyricsto "melodyVoice" {
      \lyricsAmaibu
    }
  >>

  \layout {
    indent = 18\mm

    \context {
      \Score
      \override TextScript.staff-padding = #2.2
    }
  }

  \midi { }
}
