\version "2.22.2"

\header {
  title = "Dorgunur – Die vier Gebirge"
  subtitle = "Obertonübung – notiert in C, wahlweise klingend auf Fis"
  composer = "traditionell, Altai"
  arranger = "Workshop-Fassung"
}

global = {
  \time 4/4
  \tempo 4 = 72
}

% Arbeitsfassung nach der fotografierten Vorlage
melodyC = \relative c' {
  \global
  \clef treble

  \repeat volta 2 {
    c4 f2 g4 |
    a2 c4 g2 |
    e2 g4 a2 |
    f4 e2 f4 |
    g2 c,1 |
  }
}

% Übungstext 1: neutrale Klangsilben
vowelsOne = \lyricmode {
  O __ A O
  U __ O __
  A __ E A
  O E __ O
  U __ __
}

% Übungstext 2: Bewegungsrichtungen statt IPA
% H = hinten/dunkel, M = mittig, V = vorn/hell
movementText = \lyricmode {
  "eng-hinten" __ "öffnen" "vor"
  "rund" __ "mittig" __
  "öffnen" __ "hell" "vor"
  "zurück" "mittig" __ "hell"
  "rund" __ __
}

% C-Bordun, passend zur notierten Fassung
droneC = \relative c {
  \global
  \clef bass
  \repeat volta 2 {
    c1 |
    c |
    c |
    c |
    c |
  }
}

\score {
  \new StaffGroup <<
    \new Staff \with {
      instrumentName = "Melodie"
      midiInstrument = "flute"
      midiMinimumVolume = #0.75
      midiMaximumVolume = #1.0
    } <<
      \new Voice = "dorgunur" { \melodyC }
    >>

    \new Lyrics \lyricsto "dorgunur" { \vowelsOne }
    \new Lyrics \lyricsto "dorgunur" { \movementText }

    \new Staff \with {
      instrumentName = "Bordun"
      midiInstrument = "voice oohs"
      midiMinimumVolume = #0.25
      midiMaximumVolume = #0.45
    } {
      \droneC
    }
  >>

  \layout { }
  \midi { }
}undefined