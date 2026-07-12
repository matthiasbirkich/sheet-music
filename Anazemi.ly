\version "2.22.2"
\language "deutsch"

\header {
  title = "A na zemi upokojení"
  subtitle = "Meditation auf dem Vokal U"
  composer = "Lounský graduál Jana Táborského (1572)"
  tagline = ##f
}

global = {
  \time 3/4
}

melody = \relative c' {
  \global
  \clef treble

  d8( e8) f4 d4 \breathe |
  a'8( g4) f8 e4 \breathe |
  d2. \breathe |

  a'8( h8) c4 a4 \breathe |
  d4 c8( a8) h4 \breathe |
  a2. \breathe |

  a8( h8) c4 a4 \breathe |
  c4 h8( a8) g4 \breathe |
  f2. \breathe |

  f8( g8) a4 d,4 \breathe |
  g4 f8( e8) d4 \breathe |
  c2. \breathe |

  d8( e8) f4 d4 \breathe |
  a'8( g8) g8( f8) e4 \breathe |
  d2. \bar "|."
}


\score {
  <<
    \new Staff \with {
      instrumentName = "Stimme"
      midiInstrument = "voice oohs"
    } <<
      \new Voice = "melodyVoice" { \melody }
    >>

    \new Lyrics \lyricsto "melodyVoice" {
      \lyricsU
    }
  >>

  \layout {
    indent = 18\mm
    \context {
      \Score
      \override SpacingSpanner.common-shortest-duration =
        #(ly:make-moment 1/8)
    }
  }

  \midi { }
}
