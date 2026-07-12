\version "2.22.2"
\language "deutsch"

\header {
  title = "Amaibu"
  subtitle = "Kanon zu 2–8 Stimmen"
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
  \partial 4 c8 c8 |
  c'4 b4 g4. f8 |
  e8 c8 c2 c8 c8 |
  b'4 g4 f4. e8 |
  c2. \bar "|."
}

lyricsAmaibu = \lyricmode {
  A -- ma -- i -- bu
  o -- i -- e -- i -- i
  a -- ma -- i -- bu
  o -- i -- e -- i
}

\score {
  <<
    \new Staff \with {
      instrumentName = "Stimme"
      midiInstrument = "voice oohs"
    } <<
      \new Voice = "melodyVoice" { \melody }
    >>
    \new Lyrics \lyricsto "melodyVoice" { \lyricsAmaibu }
  >>
  \layout { indent = 18\mm }
  \midi { }
}