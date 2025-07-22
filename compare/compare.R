library(colorout)
library(data.table)
library(ggplot2)

x1 <- rbind(fread("../ecuador_im/emi/evaporatives.csv"),
            fread("../ecuador_im/emi/exhaust.csv"),
            fread("../ecuador_im/emi/wear.csv"))


x2 <- rbind(fread("../ecuador_noim/emi/evaporatives.csv"),
            fread("../ecuador_noim/emi/exhaust.csv"),
            fread("../ecuador_noim/emi/wear.csv"))


x1$what <- "IM"

x2$what <- "NOIM"

x <- rbind(x1, x2)

x
ggplot(x[, 
         sum(emissions, 
             na.rm = T), 
         by = .(pol = pollutant, 
                what)],
       aes(x = what,
           y = V1,
           fill = what)) + 
  geom_col(position = "dodge") + 
  facet_wrap(~pol,
             scales = "free_y")
