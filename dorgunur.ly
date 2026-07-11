\version "2.22.2"

\header {
  title = "Dorgunur – Die vier Gebirge"
  subtitle = "Obertonmelodie über Bordun C – 11/4-Takt"
  composer = "traditionell, Altai"
  arranger = "Workshop Spiekeroog"
  tagline = ##f
}

% ---------------------------------------------------------
% Mikrotonale Notenerzeugung
%
% dur-log:
% 2 = Viertelnote
% 1 = Halbe Note
%
% cents / 200:
% LilyPond verwendet Ganztonschritte als Alterationseinheit.
% ---------------------------------------------------------

#(define (microNote oct step cents dur-log)
   (make-music
    'EventChord
    'elements
    (list
     (make-music
      'NoteEvent
      'duration (ly:make-duration dur-log 0)
      'pitch (ly:make-pitch oct step (/ cents 200))))))

melodyMicro = {
  \clef "treble^8"
  \time 11/4
  \tempo 4 = 66

  \repeat volta 2 {

    % Takt 1
    % G – C – D – E – G – D – C

    #(microNote 1 4   2 2)   % G5,  Teilton 6,  Viertel
    #(microNote 2 0   0 1)   % C6,  Teilton 8,  Halbe
    #(microNote 2 1   4 2)   % D6,  Teilton 9,  Viertel
    #(microNote 2 2 -14 1)   % E6,  Teilton 10, Halbe
    #(microNote 2 4   2 2)   % G6,  Teilton 12, Viertel
    #(microNote 2 1   4 1)   % D6,  Teilton 9,  Halbe
    #(microNote 2 0   0 1)   % C6,  Teilton 8,  Halbe
    |

    % Takt 2
    % E – G – D – C – D – E – G

    #(microNote 2 2 -14 2)   % E6,  Teilton 10, Viertel
    #(microNote 2 4   2 1)   % G6,  Teilton 12, Halbe
    #(microNote 2 1   4 2)   % D6,  Teilton 9,  Viertel
    #(microNote 2 0   0 1)   % C6,  Teilton 8,  Halbe
    #(microNote 2 1   4 2)   % D6,  Teilton 9,  Viertel
    #(microNote 2 2 -14 1)   % E6,  Teilton 10, Halbe
    #(microNote 1 4   2 1)   % G5,  Teilton 6,  Halbe
    |
  }
}

partialNumbers = \lyricmode {
  "6" "8" "9" "10" "12" "9" "8"
  "10" "12" "9" "8" "9" "10" "6"
}

centValues = \lyricmode {
  "+2c" "0c" "+4c" "-14c" "+2c" "+4c" "0c"
  "-14c" "+2c" "+4c" "0c" "+4c" "-14c" "+2c"
}

vowelExercise = \lyricmode {
  "O" "O→A" "A" "A→Ö" "Ö→E" "A" "O"
  "A→Ö" "Ö→E" "A" "O" "A" "A→Ö" "O"
}

% Bordun C:
% Jeder 11/4-Takt besteht hier aus
% 4/4 + 4/4 + 3/4 = 11/4.

droneC = \absolute {
  \clef bass
  \time 11/4

  \repeat volta 2 {
    c1~ c1~ c2. |
    c1~ c1~ c2. |
  }
}

\score {
  \new StaffGroup <<

    \new Staff \with {
      instrumentName = "Obertöne"
      midiInstrument = "flute"
      midiMinimumVolume = #0.80
      midiMaximumVolume = #1.00
    } <<
      \new Voice = "melody" {
        \melodyMicro
      }
    >>

    \new Lyrics \lyricsto "melody" {
      \vowelExercise
    }

    \new Lyrics \lyricsto "melody" {
      \partialNumbers
    }

    \new Lyrics \lyricsto "melody" {
      \centValues
    }

    \new Staff \with {
      instrumentName = "Bordun C"
      midiInstrument = "voice oohs"
      midiMinimumVolume = #0.20
      midiMaximumVolume = #0.40
    } {
      \droneC
    }
  >>

  \layout {
    indent = 22\mm
  }

  \midi { }
}