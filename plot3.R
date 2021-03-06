#Depois de descarregado o ficheiro, abrir ficando com cada variável numa coluna e tratar os missing values
data <- read.table("./household_power_consumption.txt",
                   header = TRUE, 
                   sep=";", 
                   na.strings = "?")
head(data)

#Escolher período entre 2007-02-01 e 2007-02-02
datafeb <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

head(datafeb)

#Convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions
#Junta numa coluna a informação da data e da hora
datafeb$Timestamp <- strptime(paste(datafeb$Date,datafeb$Time),format="%d/%m/%Y %H:%M:%S")

head(datafeb)


# Passar das legendas em português para inglês
# preserve the existing locale
my_locale <- Sys.getlocale("LC_ALL")

# change locale to English
Sys.setlocale("LC_ALL", "English")


# PLOT 3

# Abrir o PNG e criar a imagem 'plot1.png' na minha working directory
png(file = "plot3.png", width = 480, height = 480, units = "px")

# Cria o gráfico e envia por ficheiro (o gráfico não aparece no ecrã)
plot(datafeb$Timestamp,datafeb$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering") 
lines(datafeb$Timestamp,datafeb$Sub_metering_2,
      type="l",
      xlab="",
      ylab="Energy sub metering",
      col = "red") 
lines(datafeb$Timestamp,datafeb$Sub_metering_3,
      type="l",
      xlab="",
      ylab="Energy sub metering",
      col = "blue") 

legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Fecha o PNG
dev.off()

# restore local
Sys.setlocale("LC_ALL", my_locale)Enter file contents here
