verif_LH = function (na.omit=FALSE) {
    Q = ASHE::create_data_HYDRO(
                  "/home/louis/Documents/bouleau/INRAE/data/hydrologie",
                  "AEAG_selection", "O0362510_HYDRO_QJM.txt", "Qm3s")$Q
    Q[c(32921, 32922, 32926)] = NA

    if (na.omit) {
        Q = Q[!is.na(Q)]
    }
    
    a = 0.925
    passes = 3

    X = 1:length(Q)
    BFme = BFS(Q, a=a, passes=passes, method='LH')
    BFgrwat = grwat::gr_baseflow(Q, a=a, passes=passes, padding=0)
    BFadc = adc::bf_sep_lh(Q, a=a, n=passes, reflect=0) 

    plot = plotly::plot_ly()
    plot =  plotly::add_lines(plot,
                              x=X,
                              y=Q,
                              name="Q",
                              line=list(color='blue'))
    plot = plotly::add_lines(plot,
                             x=X,
                             y=BFgrwat,
                             name="BF_LH_grwat",
                             line=list(color='black'))
    plot = plotly::add_lines(plot,
                             x=X,
                             y=BFadc,
                             name="BF_LH_adc",
                             line=list(color='green'))
    plot = plotly::add_lines(plot,
                             x=X,
                             y=BFme,
                             name="BR_LH_louis",
                             line=list(color='red'))
    plot = plotly::layout(plot,
                          xaxis=list(title="step"),
                          yaxis=list(title="m3s-1"))

    filename = paste0("BF_LH", ".html")
    htmlwidgets::saveWidget(plot, file=filename)
} 
