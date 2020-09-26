# Conjunto de Valores de Verdade
V <- c(TRUE, FALSE)
# Criando uma tabela verdade para 5 proposições atômicas
t <- expand.grid(V,V,V,V,V)
colnames(t) <- c('p1','t100','t0','af','ac')

# Criando as premissas em função da tabela verdade
premissas <- se(t$p1, (t$af == t$t100)) &
  se(t$p1, (t$ac == t$t0)) &
  (t$p1 & (t$t100 | t$t0)) &
  !t$af

# Prova condicional da conclusão em função das premissas
prova <- se(premissas, t$t0)

