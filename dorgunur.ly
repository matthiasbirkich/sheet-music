\version "2.22.2"

\header {
  title = "Dorgunur – Die vier Gebirge"
  subtitle = "Workshop-Fassung über Bordun C · 11/4"
  composer = "traditionell, Altai"
  arranger = "Workshop-Fassung"
  tagline = ##f
}

% ---------------------------------------------------------
% Mikrotonale Note mit Teiltonnummer über der Note
%
% oct      = LilyPond-Oktavlage
% step     = Tonstufe: C=0 D=1 E=2 F=3 G=4 A=5 H=6
% cents    = Cent-Abweichung
% dur-log  = 2 Viertel, 1 Halbe
% partial  = Teiltonnummer
% ---------------------------------------------------------

#(define (microPartialNote oct step cents dur-log partial)
   (make-music
    'EventChord
    'elements
    (list

     (make-music
      'NoteEvent
      'duration (ly:make-duration dur-log 0)
      'pitch (ly:make-pitch oct step (/ cents 200)))

     (make-music
      'TextScriptEvent
      'direction UP
      'text
      (markup
       #:bold
       #:fontsize 1
       (number->string partial))))))

melodyMicro = {
  \clef "treble^8"
  \time 11/4
  \tempo 4 = 66

  \repeat volta 2 {

    % -----------------------------------------------------
    % Takt 1
    % G – C – D – E – G – D – C
    % TT 6 – 8 – 9 – 10 – 12 – 9 – 8
    % -----------------------------------------------------

    #(microPartialNote 1 4   2 2  6)
    #(microPartialNote 2 0   0 1  8)
    #(microPartialNote 2 1   4 2  9)
    #(microPartialNote 2 2 -14 1 10)
    #(microPartialNote 2 4   2 2 12)
    #(microPartialNote 2 1   4 1  9)
    #(microPartialNote 2 0   0 1  8)

    |
    \break

    % -----------------------------------------------------
    % Takt 2
    % E – G – D – C – D – E – G
    % TT 10 – 12 – 9 – 8 – 9 – 10 – 6
    % -----------------------------------------------------

    #(microPartialNote 2 2 -14 2 10)
    #(microPartialNote 2 4   2 1 12)
    #(microPartialNote 2 1   4 2  9)
    #(microPartialNote 2 0   0 1  8)
    #(microPartialNote 2 1   4 2  9)
    #(microPartialNote 2 2 -14 1 10)
    #(microPartialNote 1 4   2 1  6)

    |
  }
}

% ---------------------------------------------------------
% Centwerte unter der Obertonstimme
% ---------------------------------------------------------

centValues = \lyricmode {
  "+2 c"
  "0 c"
  "+4 c"
  "-14 c"
  "+2 c"
  "+4 c"
  "0 c"

  "-14 c"
  "+2 c"
  "+4 c"
  "0 c"
  "+4 c"
  "-14 c"
  "+2 c"
}

% ---------------------------------------------------------

% Vokalfärbungen

% ---------------------------------------------------------

vowelColours = \lyricmode {

  "O"

  "O–A"

  "A–Ö"

  "Ö–E"

  "E–I"

  "A–Ö"

  "O–A"

  "Ö–E"

  "E–I"

  "A–Ö"

  "O–A"

  "A–Ö"

  "Ö–E"

  "O"

}

% ---------------------------------------------------------

% Bewegungssymbole

% ---------------------------------------------------------

vowelSymbols = \lyricmode {

  "◕↘"

  "◑→"

  "◑↗"

  "◔↗"

  "○↑"

  "◑↗"

  "◑→"

  "◔↗"

  "○↑"

  "◑↗"

  "◑→"

  "◑↗"

  "◔↗"

  "◕↘"
}

% ---------------------------------------------------------
% Bordun C
% ---------------------------------------------------------

droneC = \absolute {
  \clef bass
  \time 11/4

  \repeat volta 2 {
    c1~ c1~ c2. |
    c1~ c1~ c2. |
  }
}

% ---------------------------------------------------------
% Partitur
% ---------------------------------------------------------

\score {

  \new StaffGroup <<

    \new Staff \with {
      instrumentName = "Oberton"

      midiInstrument = "flute"
      midiMinimumVolume = #0.80
      midiMaximumVolume = #1.00
    } <<

      \new Voice = "melody" {
        \melodyMicro
      }

    >>

    % 1. Zeile unter den Noten:
    % Cent-Abweichung

    \new Lyrics \lyricsto "melody" {
      \centValues
    }

    % 2. Zeile unter den Noten:
    % Vokalfärbung

    \new Lyrics \lyricsto "melody" {
      \vowelColours
    }

    % 3. Zeile unter den Noten:
% Bewegungssymbole

\new Lyrics \lyricsto "melody" {
  \vowelSymbols
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

  \context {

    \Score

    \override TextScript.staff-padding = #2.0

    \override SpacingSpanner.common-shortest-duration =

      #(ly:make-moment 1/8)

  }

  \context {

    \Lyrics

    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =

      #'((basic-distance . 2.5)

         (minimum-distance . 1.5)

         (padding . 1.2)

         (stretchability . 1))

  }

}

  \midi { }
}