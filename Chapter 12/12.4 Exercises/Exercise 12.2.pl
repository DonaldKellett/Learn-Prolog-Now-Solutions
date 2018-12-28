% readWord/2 predicate as provided in 12.3 Reading from Files in Learn Prolog Now!

readWord(InStream,W):-
   get_code(InStream,Char),
   checkCharAndReadRest(Char,Chars,InStream),
   atom_codes(W,Chars).


checkCharAndReadRest(10,[],_):- !.

checkCharAndReadRest(32,[],_):- !.

checkCharAndReadRest(-1,[],_):- !.

checkCharAndReadRest(end_of_file,[],_):- !.

checkCharAndReadRest(Char,[Char|Chars],InStream):-
   get_code(InStream,NextChar),
   checkCharAndReadRest(NextChar,Chars,InStream).

% Main Task

:- dynamic word/2.

main :-
  open('file.txt', read, FileStream),
  retractall(word(_, _)),
  create_db(FileStream),
  close(FileStream),
  !.

create_db(FileStream) :- at_end_of_stream(FileStream), !.
create_db(FileStream) :- readWord(FileStream, Word), update_db(Word), create_db(FileStream).

update_db('') :- !.
update_db(Word) :- word(Word, Freq), !, retract(word(Word, _)), NewFreq is Freq + 1, assert(word(Word, NewFreq)).
update_db(Word) :- assert(word(Word, 1)).
