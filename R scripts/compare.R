# jämförelse

#Java CollectionSort 100 data1 path = "~/EDAA35/projekt/resultat/Java_CollectionSort_100_data1/medelLista_Java"
#Java egen MergeSort 10 data1 path = "~/EDAA35/projekt/resultat/Java_MergeSort_10_data1/medelLista_Java"
#Python TimSort 100 data1 path = "~/EDAA35/projekt/resultat/Python_TimSort_100_data1/medelLista_Python"
#Python egen MergeSort 10 data1 path = "~/EDAA35/projekt/resultat/Python_MergeSort_10_data1/medelLista_Python"

compareResults <- function(path1, path2) {
  #JavaCollectionSort <- scan(path1, what="")
  #JavaEgenMergeSort <- scan(path2, what="")
  PythonTimSort <- scan(path1, what="")
  PythonEgenMergeSort <- scan(path2, what="")
  
  #JavaCollectionSort <- as.numeric(JavaCollectionSort)
  #JavaEgenMergeSort <- as.numeric(JavaEgenMergeSort)
  PythonTimSort <- as.numeric(PythonTimSort)
  PythonEgenMergeSort <- as.numeric(PythonEgenMergeSort)
  
  #result <-t.test(JavaCollectionSort, PythonTimSort)
  #result <-t.test(JavaEgenMergeSort, PythonEgenMergeSort)
  #result <-t.test(JavaCollectionSort, JavaEgenMergeSort)
  result <-t.test(PythonTimSort, PythonEgenMergeSort)
  
  chars <- capture.output(print(result))
  #writeLines(chars, con = file("t_test_Java-Python_data1.txt"))
  #writeLines(chars, con = file("t_test_JavaEgen-PythonEgen_data1.txt"))
  #writeLines(chars, con = file("t_test_JavaSort-JavaEgen_data1.txt"))
  writeLines(chars, con = file("t_test_PythonSort-PythonEgen_data1.txt"))
}
