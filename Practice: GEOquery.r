#Install GEOquery
if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install("GEOquery")

#Load and download a file, eg: GSE42872
library(GEOquery)
gset <- getGEO('GSE42872', destdir = ".")

#Read data
#Table cat: " ":--table. ","--csv, "!"!--:... [read.table cat]
#In most cases, need extra annotation to prevent error "line xx did not have x elements". "!" need to be removed, by defining ! is a comment. Define header.
a=read.table('file name', sep = '\t', quote = "", fill = T, comment.char = "!", header= T)

#others
class(a)
str(a)

#Convert first row to gene symbol and delete frist row, convertion package is platform-specific, e.g.: a(GSE42872/GPL6244) is hugene10sttranscriptcluster
rownames(a)=a[,1] 
a=a[,-1]

#Install package and run
BiocManager::install("hugene10sttranscriptcluster.db")
library(hugene10sttranscriptcluster.db)

#Convert ID using hugene10sttranscriptcluster to gene symbol (OR UNIPROT...: refer to ?hugene10sttranscriptcluster)
ids=toTable(hugene10sttranscriptclusterSYMBOL)

#Check length and numbers of probe-specific genes
length(unique(ids$symbol))
tail(sort(table(ids$symbol)))

#Plot pobe count
plot(table(sort(table(ids$symbol))))
