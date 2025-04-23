# Copyright 2021-2025 Louis Héraut (louis.heraut@inrae.fr)*1                     
#           2023      Éric Sauquet (eric.sauquet@inrae.fr)*1
#                     Jean-Philippe Vidal (jean-philippe.vidal@inrae.fr)*1
#                     Nathan Pellerin
#
# *1   INRAE, France
#
# This file is part of EXstat.CARD R package.
#
# EXstat.CARD R package is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation, either version 3 of
# the License, or (at your option) any later version.
#
# EXstat.CARD R package is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with EXstat.CARD R package.
# If not, see <https://www.gnu.org/licenses/>.


#' @title CARD_list_all
#' @description List all the CARD parametrization files in a [tibble][tibble::tibble()] to get all the metadata of the aggregation variables available.
#' @seealso
#' - 1. [CARD_list_all()] list all available CARD.
#' 2. [CARD_management()] for managing CARD parameterization files.
#' 3. [CARD_extraction()] for extracting variables using CARD.
#' @examples
#' # Get all the available variables
#' metaEX_all = CARD_list_all()
#' # And why note filter it by topic
#' dplyr::filter(metaEX_all, grepl("Low Flow", topic_en))
#' @export
#' @md
CARD_list_all = function () {
    inst_dir = system.file(package="EXstat.CARD")
    CARD_path_all = file.path(inst_dir, "extdata", "metaEX_all.csv")
    metaEX = dplyr::tibble(read.csv(CARD_path_all))
    return (metaEX)
}


#' @title CARD_management
#' @description Manage your different sets of variables to extract. For CARD advanced users, this function manages the CARD directory structure by performing automatic file operations to get the CARD parameterization files to your wanted directory in order to custom them or create yours to use them in a second step with [CARD_extraction()]. If you want to submit request for new CARD see the [GitHub repo](https://github.com/super-lou/EXstat.CARD)<https://github.com/super-lou/EXstat.CARD>.
#' @param CARD_name A [vector][base::c()] of [character][base::character] strings to specify which variables you want to extract. See [CARD_list_all()] to get the variable names. By default, `c("QA", "QJXA")`. If `NULL`, all the variable will be extracted, so avoid this value except with `extract_only_metadata = TRUE`.
#' @param CARD_path An optional [character][base::character] string for the path where to search for custom CARDs that have been created by the [CARD_management] function. By default, `NULL` in order to get the default CARD variable parameters.
#' @param underscore_to_white [logical][base::logical]. If `TRUE`, underscores in directory names will be replaced with spaces. Default is `TRUE`.
#' @param add_id [logical][base::logical]. If `TRUE`, numerical IDs will be added to the start of the copied and pasted CARD names to maintain the input order. Default is `TRUE`.
#' @param overwrite [logical][base::logical]. If `TRUE`, existing CARD files in the analysis directory will be overwritten. Default is `TRUE`.
#' @param verbose [logical][base::logical]. Should intermediate messages be printed during the execution of the function ? Default `FALSE`.
#' @return Selected CARD parameterization files will be created in the `CARD_path` directory.
#' @seealso
#' 1. [CARD_list_all()] list all available CARD.
#' - 2. [CARD_management()] for managing CARD parameterization files.
#' 3. [CARD_extraction()] for extracting variables using CARD.
#' @examples
#' # Get the QA and QMNA CARD variables in your local CARD_path directory
#' CARD_management(CARD_name=c("QA", "QMNA"), CARD_path="CARD-WIP")
#' @export
#' @md
CARD_management = function (CARD_name=c("QA", "QJXA"),
                            CARD_path="./WIP",
                            underscore_to_white=TRUE,
                            add_id=TRUE,
                            overwrite=FALSE,
                            verbose=FALSE) {

    CARD_path_system = system.file(package="EXstat.CARD")
    
    if (dir.exists(CARD_path)) {
        if (overwrite) {
            unlink(CARD_path, recursive=TRUE)
            dir.create(CARD_path)
        } else {
            stop(paste0("Directory ", CARD_path, " already exists, use the parameter `overwrite=TRUE` if you want to overwrite it."))
        }
    } else {
        dir.create(CARD_path)
    }
    
    # if (is.null(layout)) {
    #     layout = c(CARD_dir, "[", CARD_name, "]")
    # }
    
    # if (is.null(args)) {
        # args = list(CARD_path_system=CARD_path_system, CARD_path=CARD_path,
                    # layout=layout,
                    # underscore_to_white=underscore_to_white,
                    # add_id=add_id, overwrite=overwrite,
                    # verbose=verbose)        
    # }

    # if (is.null(args$CARD_path)) {
        # args$CARD_path = file.path(args$CARD_path_system)
    # }
        
    # if (args$verbose) {
        # remind(args)
    # }
    # if (all(args$layout == "")) {
        # print("Error : --layout is void\n", stderr())
        # stop ()
    # }

    source_dir = file.path(CARD_path_system, "__all__")

    Paths = list.files(source_dir, recursive=TRUE, full.names=TRUE)
    Files = basename(Paths)
    names(Paths) = gsub("[.].*", "", Files)

    nCARD = length(CARD_name)
    
    for (i in 1:nCARD) {
        card_name = CARD_name[i]
        from = Paths[names(Paths) == card_name]
        id_card_name = paste0(formatC(i, width=3, flag="0"), "_", card_name, ".R")
        to = file.path(CARD_path, id_card_name)
        file.copy(from, to)
    }
                   
    
    # OUT = unlist(args$layout)
    # nOUT = length(OUT)
    # test1 = "[[]|[(]|[]]|[)]"
    # test2 = "[[]|[(]"
    # for (i in 1:nOUT) {
    #     if (i < nOUT & !grepl(test1, OUT[i]) & !grepl(test2, OUT[(i+1)])) {
    #         OUT[i] = paste0(OUT[i], ".(NA)")
    #     }
    #     if (i == nOUT & !grepl(test1, OUT[(i)])) {
    #         OUT[i] = paste0(OUT[i], ".(NA)")
    #     }
    # }
    # OUT = unlist(sapply(OUT, strsplit, split="[.]"),
    #              use.names=FALSE)

    # OUT = paste0(OUT, collapse="','")
    # OUT = gsub("[]]", ")", OUT)
    # OUT = gsub("[[]|[(]", "=list(", OUT)
    # OUT = gsub("[,]['][=]", "=", OUT)
    # OUT = gsub("[(]['][,]", "(", OUT)
    # OUT = gsub("[,]['][)]", ")", OUT)
    # OUT = gsub("[)][']", ")", OUT)
    # OUT = paste0("'", OUT)
    # OUT = paste0("list(", OUT, ")")    
    # OUT = eval(parse(text=OUT))
    # OUT = unlist(OUT)
    # OUT = names(OUT)
    # OUT = gsub("[.]", "/", OUT)
    # OUT = paste0(OUT, ".R")

    # n = length(OUT)
    # SUB = c()
    # save = c()
    # IN = c()
    # DIR = c()
    # for (i in 1:n) {
    #     path = unlist(strsplit(OUT[i], "/"))
    #     len = length(path)
    #     nsd = len - 2

    #     if (nsd < 0) {
    #         print("Error : No tmp detect\n", stderr())
    #         stop ()
            
    #     } else if (nsd == 0) {
    #         id = i
            
    #     } else if (nsd > 0) {

    #         for (j in 1:nsd) {
                
    #             if (!(path[(j+1)] %in% save)) {

    #                 if (length(SUB) >= nsd) {
    #                     if (any(path %in% save)) {
    #                         SUB[sum(path %in% save)] =
    #                             SUB[sum(path %in% save)] + 1
    #                         SUB[(sum(path %in% save)+1):length(SUB)] = 1
    #                     } else {
    #                         SUB[nsd] = SUB[nsd] + 1
    #                     }
    #                 } else {
    #                     SUB = c(SUB, 1)
    #                 }
    #                 id = 1
    #                 save = c(save, path[(j+1)])
    #             }

    #             obj = path[(j+1)]
    #             if (args$underscore_to_white) {
    #                 obj = gsub("[_]", " ", obj)
    #             }

    #             if (args$add_id) {
    #                 path[(j+1)] = paste0(formatC(SUB[j],
    #                                              width=3,
    #                                              flag="0"),
    #                                      "_", obj)
    #             }
    #         }
    #     }
        
    #     IN = c(IN, path[len])
    #     DIR = c(DIR, do.call(file.path, as.list(path[-len])))
        
    #     if (args$add_id) {
    #         idC = formatC(id, width=3, flag="0")
    #         path[len] = paste0(idC, "_", path[len])
    #     }
        
    #     id = id + 1
    #     OUT[i] = do.call(file.path, as.list(path))
    # }

    # DIR = DIR[!duplicated(DIR)]
    # DIR = file.path(args$CARD_path, DIR)

    # if (any(dir.exists(DIR)) &
    #     args$overwrite |
    #     !any(dir.exists(DIR))) {
    #     if (any(dir.exists(DIR)) &
    #         args$overwrite) {
    #         unlink(DIR, recursive=TRUE, force=TRUE)
    #     }
    #     for (i in 1:n) {
    #         dir.create(DIR[i], recursive=TRUE)
    #     }

    #     for (i in 1:n) {
    #         files = list.files(source_dir, recursive=TRUE)
    #         names(files) = basename(files)
            
    #         file.copy(file.path(source_dir, files[IN[i]]),
    #                   file.path(args$CARD_path, OUT[i]))
    #     }
        
    # } else if (any(dir.exists(DIR)) &
    #            !args$overwrite) {
    #     warning (paste0("Some directories in ", paste0(DIR, collapse=", "),
    #                     " already exists. Please use 'overwrite=TRUE' if you want to overwrite current directories."))
    # }

    # if (args$verbose) {
    #     print("done")
    # }
}


remind = function (args) {
    print("PARAMETERS:")
    n = length(args)
    args_name = names(args)
    for (i in 1:n) {
        print(paste0("    --", args_name[i], " ",
                     paste0(args[[i]], collapse=" ")))
    }
}


# CARD_path = "/home/louis/Documents/bouleau/INRAE/project/CARD_project/CARD"
# CARD_tmp = "/home/louis/Téléchargements/clara"
# CARD_dir = "analyse_1"
# CARD_name = c("QMNA-5", "BFI_Wal")

# CARD_management(CARD_path=CARD_path,
#                 CARD_tmp=NULL,
#                 CARD_dir=CARD_dir,
#                 CARD_name=CARD_name,
#                 layout=c(CARD_dir, "[", "QMNA-5", "BFI_Wal", "]"),
#                 verbose=TRUE)
