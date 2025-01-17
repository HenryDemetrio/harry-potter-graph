#####################################################
#################### Autores: #######################
########## Bernardo Stocco  - RA: 22000390 ########## 
########## Cau� Ricci       - RA: 22007578 ########## 
########## Diogo Nicastro   - RA: 22005103 ########## 
########## Filipe Asaph     - RA: 22010332 ########## 
########## Henry Dem�trio   - RA: 22010597 ########## 
#####################################################

########################################################
# Criando o grafo com as informa��es dos arquivos CSV. #
########################################################

lista_de_arestas <- read.csv(file= "hp-getedges.csv",
                            header = TRUE, sep = ',',
                            dec= ',')

is.data.frame(lista_de_arestas)

head(lista_de_arestas)


lista_de_vertices <- read.csv(file= "hp-getnodes.csv",
                              header = TRUE, sep = ',', 
                              dec= ',')

is.data.frame(lista_de_vertices)

head(lista_de_vertices)


##############################################################################
# Como visto em aula, instalamos a biblioteca igraph para podermos trabalhar #
# grafos. O comando a seguir instala a biblioteca igraph.                    #
##############################################################################


install.packages('igraph')


################################################################################
# Depois de instalada, � necess�rio carregar a biblioteca para que possamos    #
# utilizar todas suas funcionalidades. O comando a seguir carrega a biblioteca #
# igraph.                                                                      #
################################################################################


library(igraph)


################################################################################
#                                                                              #
################################################################################


grafo <-graph_from_data_frame(lista_de_arestas,
                             directed = FALSE,
                             vertices = lista_de_vertices)


###############################################################################
# Executando o "TKPLOT" do grafo criado. O comando tkplot cria uma "plotagem" #
# do grafo criado em uma janela separada. O comando a seguir plota o grafo    #
###############################################################################


tkplot(grafo,
       layout=layout.lgl,
       vertex.color="light green")


##########################################################################
# Executando o comando gsize. O seguinte comando nos retorna o n�mero de #
# arestas existentes no grafo.                                           #
##########################################################################


gsize(grafo)


############################################################################
# Executando comandos para que nos seja retornado mais algumas informa��es #
# importantes sobre o grafo.                                               #
############################################################################

# sort(degree(grafo), decreasing = TRUE ) <- Retorna os graus em ordem decrescente 
sort(degree(grafo), decreasing = TRUE )


# degree(grafo) ["Hermione Granger"] <- Retorna o valor do grau da Hermione
degree(grafo) ["Hermione Granger"]


# hist(degree(grafo)) <- "Plota" o histograma do grafo utilizado
hist(degree(grafo))


# degree(grafo)[degree(grafo) > 45] <- Retorna todos os graus maiores que 45
degree(grafo)[degree(grafo) > 45]


################################################################################
# Executando o comando neighbors para a personagem Hermione. O comando retorna #
# todos os vizinhos do personagem descrito.                                    #
################################################################################


neighbors(grafo, "Hermione Granger")


###############################################################################
# Aqui, executamos o comando get_diameter. O seguinte comando retorna o valor #
# do di�metro do grafo que est� sendo utilizado.                              #
###############################################################################


get_diameter(grafo)


##############################################################################
# Executando o comando betweenness, setamos para que o comando               #
# intermediacaoVertices o executasse, para facilitar. O seguinte comando nos #
# retorna o valor das intermedia��es de cada v�rtice presente no grafo.      #
##############################################################################


intermediacaoVertices <- betweenness(grafo)
intermediacaoVertices


#############################################################################
# Aqui executamos o comando sort nas intermedia��es dos v�rtices. O comando #
# retorna os valores de todas as intermedia��es dos v�rtices em ordem       #
# decrescente.                                                              #
#############################################################################


sort(intermediacaoVertices, decreasing= TRUE )


############################################################################
# Executamos o comando max junto com o comando setado anteriormente,       # 
# intermediacaoVertices para que nos fosse retornado a maior intermedia��o #
# presente no grafo. Setamos o comando como maiorIntermediacao.            #
############################################################################


maiorIntermediacao <- max(intermediacaoVertices)
maiorIntermediacao


#############################################################################
# Aqui, executamos o comando which, que procura posi��es (�ndices) conforme #
# teste l�gico.                                                             #
#############################################################################


which(maiorIntermediacao == intermediacaoVertices)


#################################################################
# Agora, executamos o comando get_diameter e o setamos para ser #
# caminhoDoDiametro, novamente para facilitar.                  #
#################################################################

CaminhoDoDiametro <-get_diameter(grafo)

# vcol <- rep("gray40", vcount(grafo)) <- Deixa a cor dos v�rtices em cinza. 
vcol <- rep("gray40", vcount(grafo))


# vcol [CaminhoDoDiametro] <- "red" <- Deixa a cor dos v�rtices que comp�e o
# caminho do di�metro em vermelho.
vcol [CaminhoDoDiametro] <- "red"


# ecol <- rep("gray80", ecount(grafo)) <- Deixa as liga��es entre os v�rtices em
# cinza.
ecol <- rep("gray80", ecount(grafo))


# ecol [E(grafo, path=CaminhoDoDiametro)] <- "orange"<- Deixa as liga��es entre
# os v�rtices que comp�e o caminho do di�metro em laranja.
ecol [E(grafo, path=CaminhoDoDiametro)] <- "orange"


# tkplot(grafo, vertex.color=vcol, edge.color=ecol, edge.arrow.mode=0) <- Faz 
# com que o grafo seja plotado com as cores informadas acima.
tkplot(grafo, vertex.color=vcol, edge.color=ecol, edge.arrow.mode=0)


####################################################
# Calculando a centralidade de autovetor do grafo. #                                                          
####################################################


centralidade <- eigen_centrality(grafo)
centralidade







