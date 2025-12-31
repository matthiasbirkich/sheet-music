% https://www.hacklily.org 
% https://github.dev/matthiasbirkich/sheet-music
% workflow zur Renderung eines pdfs aus *.ly Dateien hinzugefügt als Lilipond-pdf.yml
% workflow ausgeführt?
\version "2.18.2"

\header {
  title = "Tintinnabulily"
  composer = "ChatGPT"
}

global = {
  \key a \minor
  \time 4/4
  \tempo 4=65
}

harmonies = \chordmode {
  a1:m | a1:m | f1 | a1:m |
  c1 | a1:m | g1 | a1:m |
  f1 | a1:m | c1 | g1 |
  d1:m | f1 | e1:7sus4 | a1:m |
  a1:m | c1 | f1 | a1:m |
  g1 | a1:m | f1 | c1 |
  d1:m | a1:m | g1 | e1:7 |
  a1:m | f1 | c1 | g1 |
  a1:m | d1:m | f1 | a1:m |
  c1 | g1 | e1:7sus4 | a1:m
}

sopranoMusic = \relative c'' {
  \global
  \clef treble
  a\pp |
  c( b) |
  a |
  b( c) |
  d |
  c( b) |
  a |
  r1 |
  g |
  a( b) |
  c |
  b( a) |
  g |
  f |
  e( d) |
  c\p|

  a |
  b( c) |
  d |
  c( b) |
  a |
  r1 |
  g |
  a( b) |
  c |
  b( a) |
  g |
  f |
  e( d)\fermata
}

% Tenor: notiert 8vb (treble_8) – deshalb eine Oktave höher schreiben,
% damit es lesbar bleibt und klingend im Bereich d3–g4 liegt.
tenorMusic = \relative c'{
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
  e1 |
  e2 c |
  a1 |
  c2 a |
  e'2 |
  c2 |
  c2 a |
  a1 |
  e'1 |
  c2 e |
  e1 |
  c2 e |
  a1 |
  r1 |
  e1 |
  c2 e |
  a1 |
  c2 a |
  e1 |
  c1 |
  c2 a |
  a1 |
  c2 e |
  a1 | e |
  c2 a |
  c1 |
  a2 c |
  e1 |
  c2 a |
  e1 g|
  a1\fermata
}

\score {
  <<
    \new ChordNames { \harmonies }
    \new ChoirStaff <<
      \new Staff \with { instrumentName = "Sopran + Alt" } { \sopranoMusic }
      \new Staff \with { instrumentName = "Tenor + Bass" }  { \tenorMusic }
    >>
  >>
  \layout { }
}

% (Optional) MIDI – Hacklily gibt das evtl. nicht aus,
% aber lokal mit LilyPond bekommst du damit eine Abspiel-Datei.
\score {
  <<
    \new Staff { \sopranoMusic }
    \new Staff { \tenorMusic }
  >>
  \midi { }
}