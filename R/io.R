#' @param file Path to parquet file to be loaded into memory
#'
#' @export
load_parquet <- function(file) {
    message <- paste("The file", toString(file), "seams not to be a valid Parquet file.")
    rlang::with_handlers(
        arrow::read_parquet(file),
        error = ~ rlang::abort(message, parent = .)
    )
}
