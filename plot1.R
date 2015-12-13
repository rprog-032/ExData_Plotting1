data <- read.table("./household_power_consumption.txt",
                   header = TRUE, 
                   sep=";", 
                   na.strings = "?")
head(data)

#Escolher período entre 2007-02-01 e 2007-02-02#
datafeb <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

head(datafeb)

#Convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.#
#Junta numa coluna a informação da data e da hora#
datafeb$Timestamp <- strptime(paste(datafeb$Date,datafeb$Time),format="%d/%m/%Y %H:%M:%S")

head(datafeb)


# PLOT 1

# Abrir o PNG e criar a imagem 'plot1.png' na minha working directory
png(file = "plot1.png", height=480, width=480, bg="transparent")

# Cria o gráfico e envia por ficheiro (o gráfico não aparece no ecrã)
hist(datafeb$Global_active_power,
     col = "red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

# Fecha o PNG
dev.off()
