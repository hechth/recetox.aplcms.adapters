#' @param peak_table Peak table from recetox.aplcms package.
#'
#' @export
#' @import dplyr
rcx_aplcms_to_xmsannotator <- function(peak_table) {
    col_base <- c("feature", "mz", "rt")
    output_table <- peak_table %>% distinct(across(any_of(col_base)))

    for (level in levels(peak_table$sample)) {
        subdata <- peak_table %>%
            filter(sample == level) %>%
            select(any_of(c(col_base, "sample_intensity"))) %>%
            rename(!!level := "sample_intensity")
        output_table <- inner_join(output_table, subdata, by = col_base)
    }
    return(output_table)
}
