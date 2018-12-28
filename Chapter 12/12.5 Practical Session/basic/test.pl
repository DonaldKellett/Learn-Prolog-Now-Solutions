:- use_module(dcg).
:- use_module(pp).

test(InFile, OutFile) :-
  open(InFile, read, InStream),
  read_sentences(InStream, L),
  select(end_of_file, L, Sentences),
  close(InStream),
  open(OutFile, write, OutStream),
  write_sentences(OutStream, Sentences),
  close(OutStream),
  !.

read_sentences(InStream, []) :- at_end_of_stream(InStream), !.
read_sentences(InStream, [Sentence | Sentences]) :-
  read(InStream, Sentence),
  read_sentences(InStream, Sentences).

write_sentences(_, []) :- !.
write_sentences(OutStream, [Sentence | Sentences]) :-
  s(ParseTree, Sentence, []),
  display(OutStream, Sentence),
  nl(OutStream),
  nl(OutStream),
  pptree(OutStream, ParseTree),
  nl(OutStream),
  write_sentences(OutStream, Sentences),
  !.
write_sentences(OutStream, [Sentence | Sentences]) :-
  display(OutStream, Sentence),
  nl(OutStream),
  nl(OutStream),
  display(OutStream, false),
  nl(OutStream),
  nl(OutStream),
  write_sentences(OutStream, Sentences).
