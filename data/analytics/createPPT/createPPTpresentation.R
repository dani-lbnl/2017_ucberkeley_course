library( ReporteRs )
library(imager)
# Create a PowerPoint document
doc = pptx( )

# Slide 1 : Title slide
#+++++++++++++++++++++++
doc <- addSlide(doc, "Title Slide")
doc <- addTitle(doc,"Women at the Lab 2018")
doc <- addSubtitle(doc, "R and ReporteRs package")
doc <- addDate(doc)
doc <- addFooter(doc, "Dani Ushizima")
doc <- addPageNumber(doc, "1/4")
# Slide 2 : Add plot
#+++++++++++++++++++++++
doc <- addSlide(doc, "Title and Content")
doc <- addTitle(doc, "Bar plot")
plotFunc<- function(){
  barplot(VADeaths, beside = TRUE,
          col = c("lightblue", "mistyrose", "lightcyan",
                  "lavender", "cornsilk"),
          legend = rownames(VADeaths), ylim = c(0, 100))
  title(main = "Death Rates in Virginia", font.main = 4)
}
doc <- addPlot(doc, plotFunc )
doc <- addPageNumber(doc, "2/4")
# Slide 3 : Add table 
#+++++++++++++++++++++++
doc <- addSlide(doc, "Two Content")
doc <- addTitle(doc,"iris data sets")
doc <- addFlexTable(doc, FlexTable(iris[1:10,] ))
doc <- addParagraph(doc, "iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica.")
doc <- addPageNumber(doc, "3/4")
# Silde 4 : Add R script
#+++++++++++++++++++++
doc <- addSlide(doc, "Content with Caption")
doc <- addTitle(doc, "R Script for histogram plot")
doc <- addPlot(doc, function() hist(iris$Sepal.Width, col=4))
r_code ="data(iris)
hist(iris$Sepal.Width, col = 4)"
doc <- addRScript(doc, text=r_code)

# Silde 5 : Add R script
#+++++++++++++++++++++
awardee = c("Ann","Bela")
doc <- addSlide(doc, "Content with Caption")
doc <- addTitle(doc, awardee[1])

plot(boats)
doc <- addPlot(doc, function() hist(iris$Sepal.Width, col=4))


# Writing Resuling powerpointt# write the document 
writeDoc(doc, "r-reporters-powerpoint.pptx" )
