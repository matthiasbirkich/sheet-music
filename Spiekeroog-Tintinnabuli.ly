\version "2.22.2"

\header {
  title = "Tintinnabuli"
  subtitle = "Vokal- und Resonanzfassung"
  composer = "Freier Tintinnabulistil nach Arvo Pärt"
  tagline = ##f
}

global = {
  \key a \minor
  \time 4/4
  \tempo 4 = 65
}

% Ruhendes harmonisches Feld:
% 15 Takte a-Moll, danach offener E-sus4-Klang
harmonies = \chordmode {
  a1:m | a:m | a:m | a:m |
  a:m | a:m | a:m | a:m |
  a:m | a:m | a:m | a:m |
  a:m | a:m | a:m | e:sus4 |
}

sopranoMusic = \relative c'' {
  \global
  \clef treble

  a1\pp |
  c2( b) |
  a1 |
  b2( c) |

  d1 |
  c2( b) |
  a1 |
  r1 |

  g1 |
  a2( b) |
  c1 |
  b2( a) |

  g1 |
  f1 |
  e2( d) |
  c1\p \fermata |
}

% Suchkorridore, nicht als fest vorgeschriebene Sprachvokale
sopranoVowels = \lyricmode {
  "A"
  "A–Ö" "A"
  "A"
  "A–Ö" "Ö–E"

  "A–Ö"
  "A–Ö" "A"
  "A"

  "O–A"
  "A" "A–Ö"
  "A–Ö"
  "A–Ö" "A"

  "O–A"
  "O"
  "O–A" "Ö–E"
  "A–Ö"
}

tenorMusic = \relative c' {
  \global
  \clef "treble_8"

  e1\pp |
  e2 c |
  c1 |
  c2 e |

  e1 |
  e2 c |
  a1 |
  r1 |

  e'1 |
  e2 c |
  a1 |
  c2 a |

  e'2 c |
  c2 a |
  c2 a |
  a1\fermata |
}

tenorVowels = \lyricmode {
  "A–Ö"
  "A–Ö" "O–A"
  "O–A"
  "O–A" "A–Ö"

  "A–Ö"
  "A–Ö" "O–A"
  "U–O"

  "A–Ö"
  "A–Ö" "O–A"
  "U–O"
  "O–A" "U–O"

  "A–Ö" "O–A"
  "O–A" "U–O"
  "O–A" "U–O"
  "U–O"
}

pianoRH = \relative c' {
  \global

  % Glockenartige, sehr sparsame Anschläge
  <a c e>1\ppp |
  s1 |
  s1 |
  s1 |

  <a c e>1 |
  s1 |
  s1 |
  s1 |

  <a c e>1 |
  s1 |
  s1 |
  s1 |

  <a c e>1 |
  s1 |
  <a b e>1 |
  <a c e>1\fermata |
}

pianoLH = \relative c {
  \global

  % A–E-Bordun
  <a e'>1~ |
  <a e'>1~ |
  <a e'>1~ |
  <a e'>1~ |

  <a e'>1~ |
  <a e'>1~ |
  <a e'>1~ |
  <a e'>1~ |

  <a e'>1~ |
  <a e'>1~ |
  <a e'>1~ |
  <a e'>1~ |

  <a e'>1~ |
  <a e'>1~ |
  <a e'>1~ |
  <a e'>1\fermata |
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }

    \new ChoirStaff <<

      \new Staff \with {
        instrumentName = "Sopran + Alt"
        midiInstrument = "flute"
      } <<
        \new Voice = "soprano" {
          \sopranoMusic
        }
      >>

      \new Lyrics \lyricsto "soprano" {
        \sopranoVowels
      }

      \new Staff \with {
        instrumentName = "Tenor + Bass"
        midiInstrument = "voice oohs"
      } <<
        \new Voice = "tenor" {
          \tenorMusic
        }
      >>

      \new Lyrics \lyricsto "tenor" {
        \tenorVowels
      }
    >>

    \new PianoStaff \with {
      instrumentName = "Bordun"
    } <<
      \new Staff {
        \clef treble
        \pianoRH
      }

      \new Staff {
        \clef bass
        \pianoLH
      }
    >>
  >>

  \layout {
    \context {
      \Lyrics
      \override LyricText.font-size = #0
    }
  }

  \midi { }
}