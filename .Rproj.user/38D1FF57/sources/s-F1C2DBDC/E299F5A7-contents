




shinyServer(function(input, output, session) {
  
  
  # initialize the master clickable datatable/ caption can be changed
  output$master = DT::renderDataTable(datatable(
    df_master, selection = 'none',
    caption = 'Using a proxy object to interact with table and map',
    options=list(columnDefs = list(list(visible=FALSE, targets=c(0))))
    )%>% formatStyle(1, cursor = 'pointer'), server = FALSE
  )
  
  
  # initialize leaflet map
  output$mymap <- renderLeaflet( leaflet()%>%
                  addTiles()%>% setView(lat = 38, lng = -90, zoom = 4)#%>% 
  )
  
  # initialize the child clickable datatable/ caption can be changed
  output$child = DT::renderDataTable(datatable(
    df_CCSD, selection = 'none', options = list(
      comlumnDefs = list(list(targets = 1, visible = FALSE)), autoWidth = FALSE, width = 300
    ),
    caption = 'Using a proxy object to interact with table and map'
  )%>% formatStyle(1, cursor = 'pointer'), server = FALSE
  #,target = 'row',backgroundColor = styleEqual(c("123W","234F"),c("green","yellow"))
  #formatStyle(
  # 'V1', 'V6',
  # backgroundColor = styleEqual(c(0, 1), c('gray', 'yellow'))
  #  )
  )
  
  # observing master table click event. 
  observeEvent(input$master_cell_clicked, {
    info = input$master_cell_clicked
    # do nothing if not clicked yet, or the clicked cell is not in the 2nd column
    if (is.null(info$value) || info$col != 1) return()
    #isolate({
    # create leaflet proxy
    proxy <- leafletProxy("mymap")
    
    # remove geojson
    removeGeoJSON(proxy,"Geojson")
    
    #get subset data from clicked value
    dfselect <- subset(data_json, ASI == info$value)
    
    # paste the vector from dfselect [geojson]field and seperated them with a coma
    y3 <- paste(dfselect$geojson, collapse = ",")
    
    # make this paste results a geojson Feature Collection
    x <- paste0("{\"type\":\"FeatureCollection\",\"features\":[",y3,"]}") 
    
    #add geojson x to map proxy with layer name "Geojson"
    addGeoJSON(proxy,x,layerId = "Geojson")
  })
  
  # observing master table click event. 
  observeEvent(input$child_cell_clicked, {
    info = input$child_cell_clicked
    # do nothing if not clicked yet, or the clicked cell is not in the second column
    if (is.null(info$value) || info$col != 1) return()
    #isolate({
    # create leaflet proxy
    proxy <- leafletProxy("mymap")
    
    # remove geojson
    removeGeoJSON(proxy,"Geojson")
    
    #get subset data from clicked value
    dfselect <- subset(data_json, CCSD == info$value)
    
    # paste the vector from dfselect [geojson]field and seperated them with a coma
    y3 <- paste(dfselect$geojson, collapse = ",")
    
    # make this paste results a geojson Feature Collection
    x <- paste0("{\"type\":\"FeatureCollection\",\"features\":[",y3,"]}") 
    
    #add geojson x to map proxy with layer name "Geojson"
    addGeoJSON(proxy,x,layerId = "Geojson")
  })
  
})
  
  
