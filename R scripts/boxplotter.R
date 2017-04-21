# BoxPlot

setwd("~/EDAA35/projekt")

JavaSort <- read.csv(file="~/EDAA35/projekt/resultat/Java_CollectionSort_100_data1/medelLista_Java", header=FALSE)
JavaMerge <- read.csv(file="~/EDAA35/projekt/resultat/Java_MergeSort_10_data1/medelLista_Java", header=FALSE)
PythonSort <- read.csv(file="~/EDAA35/projekt/resultat/Python_TimSort_100_data1/medelLista_Python", header=FALSE)
PythonMerge <- read.csv(file="~/EDAA35/projekt/resultat/Python_MergeSort_10_data1/medelLista_Python", header=FALSE)


colHeadings <- c('Java\nCollectionSort', 'Java\negen MergeSort', 'Python\nTimSort', 'Python\negen MergeSort')
#colHeadings <- c('Java CollectionSort', 'Python TimSort')
indata <- data.frame(JavaSort, JavaMerge, PythonSort, PythonMerge)
#indata <- data.frame(JavaSort, PythonSort)
names(indata) <- colHeadings


#boxplotter <- boxplot(indata, main="Jämförelse mellan inbyggda algoritmer (data1)", ylab="tid (ns)", xlab="algoritm")
boxplotter <- boxplot(indata, main="Jämförelse mellan algoritmer (data1)", ylab="tid (ns)", xlab="algoritm")

pdf("4st_boxplot.pdf")
#pdf("JvsP_boxplot.pdf")
#boxplot(indata, main="Jämförelse mellan inbyggda algoritmer (data1)", ylab="tid (ns)", xlab="algoritm")
boxplotter <- boxplot(indata, main="Jämförelse mellan algoritmer (data1)", ylab="tid (ns)", xlab="algoritm")
dev.off()