get.nowdata<-function(symbol,...){
options(warn =-1)
url_0=paste("http://vol.stock.hexun.com/Now/Share/DealDetail_1.ashx?rank=3&dealtype=0&code=",symbol,sep="")
raw_0=read.table(url_0,colClasses="character",fill=T,sep="[")
raw_1=strsplit(as.character(raw_0),",|]")
raw_2=unlist(raw_1)
raw_4=matrix(raw_2[-(1:4)],ncol=7,byrow=T)[,-7]
temp=tempfile()
write.table(raw_4,temp)
data=read.table(temp,dec="'")
for(i in 2:4){data[,i]=as.numeric(as.character(data[,i]))}
colnames(data)=c("Time","Volum","Price","Turnover","Orders","NIO")
list(symbol=raw_2[1],Company=raw_2[2],Date=raw_2[3],Details=data)
}
