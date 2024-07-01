# SEND-Coding-Bootcamp
* Use Posit Cloud as environment for training (users have to setup a free account)
* Body Weight Graph
  * Motivating Example:
    * Plot y = BW, x = DY, by SETCD/SEX
      * Grow the complexity of the plot over the session
  * Foundational Concepts:
    * Reading and writing data.frames
      * Columns and Rows (indexing)
      * 
  * Logical Flow
    * Discuss installing/loading packages
    * Read BW XPT File
      * Use library(haven) and then convert to data.frame
    * Print table of BW data for an animal
    * plot(BWNOMDY, BWSTRESN)
    * ggplot(BW, aes(x = BWNOMDY, y = BWSTRESN)) + geom_point()
    * Read DM XPT File
    * Join BW and DM
      * BW_DM <- dplyr::left_join
    * ggplot(BW_DM, aes(x = BWNOMDY, y = BWSTRESN, color = SETCD, shape = SEX)) + geom_point()
    * Compute and plot group means

* Dataset JSON <-> XPT
* R Shiny
* Quarto Documentation
