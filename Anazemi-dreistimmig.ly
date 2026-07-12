\version "2.22.2"
\language "deutsch"

\header {
  title = "A na zemi upokojení"
  subtitle = "Dreistimmiger Kanon auf dem Vokal U"
  composer = "Lounský graduál Jana Táborského (1572)"
  tagline = ##f
}

global = {
  \time 11/4
  \tempo 4 = 60
}

% ---------------------------------------------------------
% Jeder Kanonabschnitt dauert 11 Viertel.
%
% 1. Stimme: Einsatz sofort, Schlussklang 5 Viertel
% 2. Stimme: Einsatz nach 1 Viertel, Schlussklang 4 Viertel
% 3. Stimme: Einsatz nach 2 Vierteln, Schlussklang 3 Viertel
%
% Dadurch enden alle drei Stimmen gleichzeitig.
% ---------------------------------------------------------

voiceOne = \relative c' {
  \global
  \clef treble
  \set Staff.midiInstrument = "voice oohs"

  d8( e8) f4 d4 \breathe
  a'8( g4) f8 e4 \breathe
  d2.~ d2 |
  \break

  a'8( h8) c4 a4 \breathe
  d4 c8( a8) h4 \breathe
  a2.~ a2 |
  \break

  a8 h8 c4 a4 \breathe
  c4 h8( a8) g4 \breathe
  f2.~ f2 |
  \break

  f8 g8 a4 d,4 \breathe
  g4 f8 e8 d4 \breathe
  c2.~ c2 |
  \break

  d8( e8) f4 d4 \breathe
  a'8( g8) g8( f8) e4 \breathe
  d2.~ d2 |
  \bar "|."
}

voiceTwo = \relative c' {
  \global
  \clef treble
  \set Staff.midiInstrument = "voice oohs"

  r4
  d8( e8) f4 d4 \breathe
  a'8( g4) f8 e4 \breathe
  d1 |

  r4
  a'8( h8) c4 a4 \breathe
  d4 c8( a8) h4 \breathe
  a1 |

  r4
  a8 h8 c4 a4 \breathe
  c4 h8( a8) g4 \breathe
  f1 |

  r4
  f8 g8 a4 d,4 \breathe
  g4 f8 e8 d4 \breathe
  c1 |

  r4
  d8( e8) f4 d4 \breathe
  a'8( g8) g8( f8) e4 \breathe
  d1 |
  \bar "|."
}

voiceThree = \relative c' {
  \global
  \clef treble
  \set Staff.midiInstrument = "voice oohs"

  r2
  d8( e8) f4 d4 \breathe
  a'8( g4) f8 e4 \breathe
  d2. |

  r2
  a'8( h8) c4 a4 \breathe
  d4 c8( a8) h4 \breathe
  a2. |

  r2
  a8 h8 c4 a4 \breathe
  c4 h8( a8) g4 \breathe
  f2. |

  r2
  f8 g8 a4 d,4 \breathe
  g4 f8 e8 d4 \breathe
  c2. |

  r2
  d8( e8) f4 d4 \breathe
  a'8( g8) g8( f8) e4 \breathe
  d2. |
  \bar "|."
}

\score {
  <<
    \new StaffGroup <<
      \new Staff \with {
        instrumentName = "1. Stimme (U)"
        shortInstrumentName = "1."
      } { \voiceOne }

      \new Staff \with {
        instrumentName = "2. Stimme (U)"
        shortInstrumentName = "2."
      } { \voiceTwo }

      \new Staff \with {
        instrumentName = "3. Stimme (U)"
        shortInstrumentName = "3."
      } { \voiceThree }
    >>
  >>

  \layout {
    indent = 26\mm

    \context {
      \Score
      \override SpacingSpanner.common-shortest-duration =
        #(ly:make-moment 1/8)
    }

    \context {
      \Staff
      \omit BarLine
    }
  }

  \midi { }
}
