# hantering av java-kod

setwd("~/EDAA35/projekt")
source("/usr/local/cs/EDAA35/R_resources.R") #koden för confidenceInterval-metoden

# plottar kurvan till skärmen för att se insvägningsförloppet
plotresult <- function(file, start = 1) {
  data <- read.csv(file)
  data <- data[start:nrow(data),]
  plot(data, type = 'l', ylim=c(200000, 1700000), ylab="tid (ns)", main="Java egen MergeSort (data2)")
  #plot(data, type = 'l', ylim=c(0, 250000), ylab="tid (ns)", main="Java CollectionSort (data2)")
}
#system("java JavaSorter data2.txt resultJava.txt 10000")

plotresult("resultJava.txt")
pdf("resultJava.pdf")
plotresult("resultJava.txt")
dev.off()

medelMedelJava <- function(n) {
  medelLista = vector()
  i = 0
  while(i < n) {
    system("java JavaSorter data2.txt resultJava.txt 10000")

    jamviktVarden <- read.csv("resultJava.txt")
    jamviktVarden <- tail(jamviktVarden, 2000)
    medel <- mean(jamviktVarden$tid)

    medelLista <- rbind(medelLista, medel)

    i <- i + 1
  }
  medelAvMedel <- mean(medelLista)
  konf <- confidenceInterval(medelLista)
  write(medelLista, file = "medelLista_Java", ncolumns = 1)
  write(medelAvMedel, file = "medelAvMedel_Java")
  write(konf, file = "konfidensIntervall_Java")
}

