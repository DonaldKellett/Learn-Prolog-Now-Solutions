main :-
  open('hogwart.houses', write, FileStream),
  tab(FileStream, 7),
  write(FileStream, gryffindor),
  nl(FileStream),
  write(FileStream, hufflepuff),
  tab(FileStream, 5),
  write(FileStream, ravenclaw),
  nl(FileStream),
  tab(FileStream, 7),
  write(FileStream, slytherin),
  nl(FileStream),
  close(FileStream).
