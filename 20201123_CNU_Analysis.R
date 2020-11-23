library(ggplot2)
require("ggrepel")
data_CNU = read.table("Demographie_sections_CNU.csv", h=T, sep=";")

tapply(data_CNU$Candidatures.MCF/data_CNU$PostesPublies.MCF, data_CNU$TypeRecrutement, mean, na.rm=T) # 33.41557

ggplot(data_CNU, aes(x = GrandeDisciplineCNU, y = Candidatures.MCF/PostesPublies.MCF, color=GroupeCNU)) + 
  geom_jitter(position=position_jitter(0.2)) + 
  geom_hline(yintercept=33.41557, linetype="dashed", color = "red") + 
  stat_summary(fun=median, geom="point", shape=15, size=3, color="red") + 
  labs(title="Recrutements MCF par section, de 2013 à 2019", x ="Grandes disciplines CNU", y = "Nombre moyen de candidatures par poste de MCF") +
  labs(color = "Groupes CNU") + 
  annotate(geom="text", x=3, y=36, label="Moyenne globale", color="red")

tapply(data_CNU$Candidatures.MCF/data_CNU$PostesPublies.MCF, data_CNU$GrandeDiscipline, mean, na.rm=T)