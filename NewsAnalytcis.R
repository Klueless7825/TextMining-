# load packages
#library(twitteR)
library(tm)
library(tm.plugin.webmining)
library(tm.plugin.sentiment)
library(XML)
library(openNLP)
library(qdap)

corpus <-  WebCorpus(GoogleFinanceSource("AAPL"))
stock <- "AAPL"
corpus <- as.String(corpus) 

word_ann <- Maxent_Word_Token_Annotator()
sent_ann <- Maxent_Sent_Token_Annotator()

sentences <- annotate(corpus, list(sent_ann, word_ann))

bio_doc <- AnnotatedPlainTextDocument(corpus, sentences)
sents(bio_doc) %>% head(2)
class(sentences)
filteredSentences <- sentences[grepl(stock,sentences)] 

