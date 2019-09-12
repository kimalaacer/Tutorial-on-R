x<-10:1
y<--5:4
q<-c('Hockey', 'Football', 'Baseball', 'Curling', 'Rugby',
  'Lacrosse', 'Basketball', 'Tennis', 'Cricket', 'Soccer')
theDF<-data.frame(x, y, q)

theDF

theDF<-data.frame(First=x, Second= y, Sport=q)

class(theDF$Sport)

theDF<-data.frame(First=x, Second= y,Sport=q, stringsAsFactors=FALSE)
class(theDF$Sport)

nrow(theDF)
ncol(theDF)
dim(theDF)

NROW(theDF)
nrow(x)
length(x)

NROW(x)

names(theDF)
nrow(theDF)[3]

rownames(theDF)
rownames(theDF)<-c('One', 'Two', 'Three', 'Four', 'Five', 'Six',
  'Seven', 'Eight', 'Nine', 'Ten')


rownames(theDF)


theDF

head(theDF)

head(theDF, n=7)

tail(theDF)

class(theDF)

theDF$Sport

theDF[3,2]

theDF[, 3, drop=FALSE]

theDF[,c('First', 'Sport')]

theDF[,c('Sport', 'First')]

