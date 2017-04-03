# Create a directory called "R_Programming" in your R working directory, then place your PDFs in there.
# If the directory doesn't exist you'll get an error.
path <- "R_Programming"
file.names <- dir(path, pattern =".pdf")
if ( !dir.exists(path) ) {
  print( paste("ERROR: The directory [", path, "] doesn't exist! Aborting.", sep = "") )
} else {
  for ( i in 1:length(file.names) ) {
    # This uses perl regular expressions to grab the actual filename.
    new_name <- sub("_[^_]+_(.+\\.pdf)", "\\1", file.names[i], perl = TRUE )
    # Only do a rename if the file names are not identical (IE, already renamed)
    if ( !identical(file.names[i], new_name) ) {
      print( paste("Renaming [", file.path(path, file.names[i]), "] to [", file.path(path, new_name), "]", sep = "") )
      file.rename( file.path(path, file.names[i]), file.path(path, new_name) )
    }
  }
}
print("Done renaming files.")
dir(path)
