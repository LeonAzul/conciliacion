# Select features

df <- readRDS('../clean_data/observaciones_expandido.RDS')

control_vars <- c("id_exp","exp", "anio")
label_vars <- c("modo_termino", "liq_total") 

train_vars <- c("reclutamiento",
                      "sueldo",         
                      "gen",
                      "antig",
                      "reinst",  
                      "hextra", 
                      "sarimssinf",   
                      "codem",          
                      "modo_termino",
                      "liq_total")

vars_joyce <- c('sueldo',
                'gen',
                'horas_sem',
                'hextra',
                'hextra_sem',
                'rec20', #imputado como trabajador de confianza
                'prima_dom',
                'desc_sem',
                'desc_ob',
                'sarimssinf', # Partir en tres preguntas (componentes)
                'c_indem',
                'min_ley', # Darle prioridad sobre otros c_*; meteríamos otras prestaciones
                #'top_dem',
                'c_sal_caidos')
                #'antig>15'*'prima_antig'

#probabilidad de ganar: multiplicar por x<1 en caso de carta de renuncia

 df %>% select(one_of(train_vars), 
                one_of(vars_joyce), 
                starts_with('giro'),
                starts_with('junta'),
                starts_with('ln')) %>%
                saveRDS(., '../clean_data/observaciones_selected.RDS')
rm(list=ls())
