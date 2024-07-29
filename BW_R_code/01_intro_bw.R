# package vs library 
# commenting code, about comments
# ? help about function

# installing package

# install.packages('haven')
# install.packages('ggplot2')
# install.packages('dplyr')

# load from library
library(haven)
# library(dplyr)
# library(ggplot2)
# library(RColorBrewer)
# library(scales)

# read xpt file with haven package

bw <- haven::read_xpt("~/OneDrive - FDA/yousuf/10_DATA/Biocelerate_shared_data/data/biocelerate_all_data/1MDogA_send/bw.xpt")
## bw <- haven::read_xpt("data/mock_SEND_data/instem/bw.xpt")
# write to csv file
# read back the file in dataframe
# attribute (label) lost
# mention to read excel file

# convert to base R dataframe
bw <- as.data.frame(bw)
edit(bw)
# getting a peek at data
head(bw)

# View the whole table
View(bw)
# edit()
# know more about your dataframe/table
str(bw)

print(head(bw$BWSTRESN))
head(bw$BWSTRESN)
print(bw[[1]])
print(bw[['BWSTRESN']])
bw[1:5,]

# access one column
bw$USUBJID

bw[['USUBJID']]
# column names
colnames(bw)
# slice  multiple colums
bw_short <- bw[, c('STUDYID','USUBJID',
                   'BWTESTCD','VISITDY','BWSTRESN','BWSTRESU')]

head(bw_short)

# find unique animals

unq_animals <- unique(bw$USUBJID)
unq_animals
length(unq_animals)

# table for a animal

an_animal <- bw[bw$USUBJID=='43066-1101',]
View(an_animal)


# some helpful function, there are more
# count
table(bw[['BWTEST']])
# summary
summary(bw$BWSTRESN)

# missing value

is.na(bw$BWSTRESN)
sum(is.na(bw$BWSTRESN))

# plot
# plot a single numeric variable/column
plot(bw$BWSTRESN)

###################################

# individual values of body weight
plot(bw$BWSTRESN)
# pch= plotting character
# col = color
## plot(bw$BWSTRESN, pch = 21, col='black')
## ## plot(bw$BWSTRESN, pch = 1, col='black')
## plot(bw$BWSTRESN, pch = 2, col='black')
plot(bw$BWSTRESN, pch = 17, col='red')

  plot(bw$BWSTRESN,col='red',
       main = 'scatter plot for  BWSTRESN',
       xlab = '',
     ylab = 'BWSTRESN')

unique(bw$BWTESTCD)
plot(bw$BWSTRESN,col=ifelse(bw$BWTESTCD=='BW','skyblue','red'),pch = 19)
legend('topright',legend =  c('BW','TERMBW'), col=c('skyblue','red'),pch = 19)
## plot(bw$BWSTRESN,col=ifelse(bw$BWTESTCD=='BW','skyblue','red'),pch = 17)
## plot(bw$BWSTRESN,col=ifelse(bw$BWTESTCD=='BW','skyblue','red'),pch = 18)



## ggplot2::ggplot(data=bw, ggplot2::aes(BWSTRESN,fill=BWTESTCD))+
##   ggplot2::geom_histogram()

hist(bw$BWSTRESN, col = 'darkgray')
hist(bw$BWSTRESN, col = 'darkgray',breaks = 20)
hist(bw$BWSTRESN, col = 'darkgray',border = 'darkgray')

hist(bw$BWSTRESN, col = 'darkgray',border = 'black',
     main = 'Histogram of Body Weight',
     xlab = 'Body Weight')

hist(bw$BWSTRESN, breaks = ,col = 'lightblue',border = 'white',
     main = 'Histogram of Body Weight',
     xlab = 'Body Weight')

plot(bw$VISITDY,bw$BWSTRESN)
unique(bw$VISITDY)

boxplot(bw$BWSTRESN)
barplot(table(bw$BWTESTCD))

## ggplot2::ggplot(data=bw, ggplot2::aes(VISITDY,BWSTRESN, color=VISITDY))+
##   ggplot2::geom_point()

dm <- haven::read_xpt("~/OneDrive - FDA/yousuf/10_DATA/Biocelerate_shared_data/data/biocelerate_all_data/1MDogA_send/dm.xpt")
## dm <- haven::read_xpt("data/mock_SEND_data/instem/dm.xpt")
## dm <- haven::read_xpt('../../data/PDS/dm.xpt')
dm  <- as.data.frame(dm)
head(dm)
bw_m <- bw[, c('STUDYID','DOMAIN','USUBJID','BWTESTCD',
                       'BWSTRESN','BWSTRESU','VISITDY','BWDY','BWDTC')]

dm_m <- dm[, c('USUBJID','SEX','SETCD')]
# merge bw and dm
df_merge <- merge(bw_m, dm_m, by = 'USUBJID')

head(df_merge)
#

unique(df_merge$SETCD)
# plot BWSTRESN and VISITDY
plot(df_merge$VISITDY,df_merge$BWSTRESN,
     col = ifelse(df_merge$SEX=='M','skyblue','red'),
     xlab = 'VISITDAY',
     ylab = 'BWSTRESN',
     pch=19,cex = .8)
legend('bottomright',c('Male','Female'),col = c('skyblue','red'),pch=19)

# hex color code
## blue and red ggplot version
## '#00BFC4','#F8766D'
# SETCD  recovery animal is gray
plot(df_merge$VISITDY,df_merge$BWSTRESN,
     col = ifelse(df_merge$SETCD=='1','skyblue',
           ifelse(df_merge$SETCD=='2','purple',
           ifelse(df_merge$SETCD=='3','green',
           ifelse(df_merge$SETCD=='4','red','gray')))),
     pch=ifelse(df_merge$SEX=='M',18,19))

legend('bottomright',legend = c('1','2','3','4','5'),
       col = c('skyblue','purple','green','red','gray'),
       pch = 19)
legend('right',legend = c('M','F'),pch = c(18,19))



# better color
RColorBrewer::display.brewer.all()
RColorBrewer::display.brewer.all(7,select = 'Spectral')
## show_col(scales::pal_hue()(9))
unique(df_merge$SETCD)
cl <- brewer.pal(n=7,name = 'Set1')
cl <- brewer.pal(n=7,name = 'Spectral')
cl
plot(df_merge$VISITDY,df_merge$BWSTRESN,
     col = ifelse(df_merge$SETCD=='1',cl[1],
           ifelse(df_merge$SETCD=='1R',cl[2],
           ifelse(df_merge$SETCD=='2',cl[3],
           ifelse(df_merge$SETCD=='3',cl[4],
           ifelse(df_merge$SETCD=='3R',cl[5],
           ifelse(df_merge$SETCD=='4',cl[6],
           ifelse(df_merge$SETCD=='4R',cl[7],'black'))))))),
     pch=ifelse(df_merge$SEX=='M',17,19),
     cex=.8)
legend('bottomright',legend = c('1','1R','2','3','3R','4','4R'),
       col = c(cl,'black'), pch = 19,cex = .8)
legend('right',legend = c('M','F'), pch = c(17,19),cex = .8)
### sclaes package and factor
df_merge$SETCD <- factor(df_merge$SETCD)
df_merge$SEX <- factor(df_merge$SEX)
colors_cus <- scales::hue_pal()(7)
scales::show_col(colors_cus)
plot(df_merge$VISITDY,df_merge$BWSTRESN,
     col = colors_cus[df_merge$SETCD],
     pch = ifelse(df_merge$SEX=='M',16,17),cex=0.8)
legend('bottomright',legend = levels(df_merge$SETCD),
       col = colors_cus,
       pch = 16)
legend('topright',legend = c('M','F'),
       pch = c(16,17))
# with ggplot2
ggplot2::ggplot(data=df_merge, ggplot2::aes(VISITDY,BWSTRESN, color=SEX))+
  ggplot2::geom_point()

ggplot2::ggplot(data=df_merge,
                ggplot2::aes(VISITDY,BWSTRESN, color=SETCD,shape=SEX))+
  ggplot2::geom_point()

ggplot2::ggplot(data=df_merge, ggplot2::aes(VISITDY,BWSTRESN, color=SEX))+
  ggplot2::geom_point()


# mean body weight
# base R
result <- aggregate(BWSTRESN ~ SETCD+SEX+VISITDY,
                    data= df_merge, FUN = mean)
df_mean_gr <- merge(df_merge, result, by = c('SETCD','SEX','VISITDY'),
                    suffixes = c("","_mean"))
head(df_mean_gr)
df_mean_or <- df_mean_gr[order(df_mean_gr$USUBJID,df_mean_gr$VISITDY),]
head(df_mean_or)
# reorder columns
coln <- c("USUBJID", "STUDYID", "DOMAIN",
          "BWTESTCD", "BWSTRESN", "BWSTRESU", "BWDY",  "SETCD", "SEX", "VISITDY",
          "BWSTRESN_mean","BWDTC")
col_ord_df <- df_mean_or[, coln]
head(col_ord_df)
# dplyr
# calculate mean
df_mean <- df_merge %>% dplyr::group_by(SEX,SETCD,VISITDY) %>%
  dplyr::mutate(mean_bw= mean(BWSTRESN))

df_mean <- as.data.frame(df_mean)
head(df_mean)
# plot base R
cl <- scales::pal_hue()(7)
df_mean$SETCD <- factor(df_mean$SETCD)
df_mean$SEX <- factor(df_mean$SEX)
plot(df_mean$VISITDY,df_mean$mean_bw,col = cl[df_mean$SETCD],
     pch = c(16,17)[df_mean$SEX],
     xlab = 'VISITDY',
     ylab = 'Mean Body Weight')
legend('bottomright',legend = levels(df_mean$SETCD),
       col = cl, pch = 19,cex = .8)
legend('right',legend =levels(df_mean$SEX) , pch = c(16,17),cex = .8)
#########

#   line graph
#   ###############################
#
df_plot <- df_mean[, c('VISITDY','SEX','SETCD','mean_bw')]
df_plot$mean_bw  <- round(df_plot$mean_bw,digits = 2)
dim(df_plot)
new_df <- df_plot[!duplicated(df_plot),]
dim(new_df)
df_mean <- new_df

cl <- scales::pal_hue()(7)
df_mean$SETCD <- factor(df_mean$SETCD)
df_mean$SEX <- factor(df_mean$SEX)
plot(df_mean$VISITDY,df_mean$mean_bw,col = cl[df_mean$SETCD],
     pch = c(16,17)[df_mean$SEX],
     xlab = 'VISITDY',
     ylab = 'Mean Body Weight')
legend('bottomright',legend = levels(df_mean$SETCD),
       col = cl, pch = 19,cex = .8)
legend('right',legend =levels(df_mean$SEX) , pch = c(16,17),cex = .8)
#########

set_codes <- unique(df_mean$SETCD)
sex_uniq <- unique(df_mean$SEX)
for (i in 1:length(set_codes)) {
  for (j in 1:length(sex_uniq)){
subs <- df_mean[df_mean$SETCD==set_codes[i] & df_mean$SEX==sex_uniq[j],]
## lines(subs$VISITDY,subs$BWSTRESN_mean, col = cl[i])
lines(subs$VISITDY,subs$mean_bw,col = cl[i])


  }
}

##############

# ggplot2
ggplot2::ggplot(data = df_mean, ggplot2::aes(x=VISITDY,y=mean_bw,color=SETCD,shape=SEX))+
  ggplot2::geom_point()+
  ggplot2::geom_line()


ggplot2::ggplot(data = df_mean, ggplot2::aes(x=VISITDY,y=mean_bw,color=SETCD,shape=SEX))+
  ggplot2::geom_point()
