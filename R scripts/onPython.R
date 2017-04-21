# hantering av python.kod

setwd("~/EDAA35/projekt")
source("/usr/local/cs/EDAA35/R_resources.R") #koden för confidenceInterval-metoden

# plottar kurvan till skärmen för att se eventuella skillnader
plotresult <- function(file, start = 1) {
  data <- read.csv(file)
  data <- data[start:nrow(data),]
  #plot(data, type = 'l', ylim=c(100000, 350000), ylab="tid (ns)", main="Python TimSort (data1)")
  plot(data, type = 'l', ylim=c(0, 250000), ylab="tid (ns)", main="Python TimSort (data2)")
  #plot(data, type = 'l', ylim=c(2800000, 3050000), ylab="tid (ns)", main="Python egen MergeSort (data1)")
  #plot(data, type = 'l', ylim=c(2800000, 4300000), ylab="tid (ns)", main="Python egen MergeSort (data1)")
  #plot(data, type = 'l', ylim=c(2600000, 2850000), ylab="tid (ns)", main="Python egen MergeSort (data2)")
  #plot(data, type = 'l', ylim=c(2600000, 4100000), ylab="tid (ns)", main="Python egen MergeSort (data2)")
}
#system("python3.5 PythonSorter.py data2.txt resultPython.txt 10000")

plotresult("resultPython.txt")
pdf("resultPython.pdf")
plotresult("resultPython.txt")
dev.off()

medelMedelPython <- function(n) {
  medelLista = vector()
  i = 0
  while(i < n) {
    system("python3.5 PythonSorter.py data2.txt resultPython.txt 10000")

    jamviktVarden <- read.csv("resultPython.txt")
    jamviktVarden <- tail(jamviktVarden, 2000)
    medel <- mean(jamviktVarden$tid)

    medelLista <- rbind(medelLista, medel)

    i <- i + 1
  }
  medelAvMedel <- mean(medelLista)
  konf <- confidenceInterval(medelLista)
  write(medelLista, file = "medelLista_Python", ncolumns = 1)
  write(medelAvMedel, file ="medelAvMedel_Python")
  write(konf, file = "konfidensIntervall_Python")
}
