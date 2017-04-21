import time
import csv
import sys


def readFile(fileName, results) :
    with open(fileName, newline='') as inputfile:
        for row in csv.reader(inputfile):
            results.append(int(row[0]))

    return results

def writeFile(fileName, results) :
    file = open(fileName, "w")

    for item in results:
        file.write("%s\n" % item)

    file.close()

def mergeSort(alist) :
    #print("Splitting ",alist)
    if len(alist)>1:
        mid = len(alist)//2
        lefthalf = alist[:mid]
        righthalf = alist[mid:]

        mergeSort(lefthalf)
        mergeSort(righthalf)

        i=0
        j=0
        k=0
        while i < len(lefthalf) and j < len(righthalf):
            if lefthalf[i] < righthalf[j]:
                alist[k]=lefthalf[i]
                i=i+1
            else:
                alist[k]=righthalf[j]
                j=j+1
            k=k+1

        while i < len(lefthalf):
            alist[k]=lefthalf[i]
            i=i+1
            k=k+1

        while j < len(righthalf):
            alist[k]=righthalf[j]
            j=j+1
            k=k+1
     #print("Merging ",alist)
 #print(alist)

def sortList(aList) :
   "This method sorts a list and returns the time it took in nanoseconds"
   start = time.time()
   aList.sort()
   #mergeSort(aList)
   end = time.time()
   totTime = 1000000000*(end-start)
   return totTime





#main

lista = []
timesList = [];

#lista = readFile("inputfile.txt", lista)
lista = readFile(sys.argv[1], lista)
max = int(sys.argv[3])
timesList.append("löpnummer, tid")
for x in range(0, max) :
    lista2 = list(lista)

    timesList.append(str(x+1)+", "+ str(sortList(lista2)))

#writeFile('textfile.txt', timesList)
writeFile(sys.argv[2], timesList)
