
# function to add 2 or 3 tables to an excel worksheet.
# function will format sheet following accessibility guidelines
# Requires a sheet title and sheet name, and a table title, df and table name for each table. 

f_excel_multi_tables <- function(sheet_title, num_tbls, notes = c(NA), t1_title, t2_title, t3_title = NA, df_1, df_2, df_3 = NA, sheet, table1name, table2name, table3name = NA,
                                 num_cols = NA,
                                 pct_cols = NA) {
  r <- 1
  
  writeData(new_workbook,
            sheet = sheet,
            x = paste0(sheet_title),
            startRow = r,
            colNames = FALSE
  )
  
  addStyle(new_workbook, sheet,
           style = pt,
           rows = r,
           cols = 1
  )
  
  r <- r + 1
  
  writeData(new_workbook,
            sheet = sheet,
            x = paste0("This worksheet contains ", num_tbls, " tables presented vertically and separated by a single blank row. Refs to notes can be found on the notes tab."),
            startRow = r,
            colNames = FALSE
  )
  
  r <- r + 1
  if (is.na(notes[1])) {
    
    
  } else {
    writeData(new_workbook,
              sheet = sheet,
              x = "Notes",
              startRow = r,
              colNames = FALSE
    )
    
    addStyle(new_workbook,
             sheet = sheet,
             style = pt2,
             rows = r,
             cols = 1
    )
    
    r <- r + 1
    
    writeData(new_workbook,
              sheet = sheet,
              x = paste0(notes),
              startRow = r,
              colNames = FALSE
    )
    
    r <- r + length(notes)
  }
  
  writeData(new_workbook,
            sheet = sheet,
            x = paste0(t1_title),
            startRow = r,
            colNames = FALSE
  )
  
  addStyle(new_workbook,
           sheet = sheet,
           style = pt2,
           rows = r,
           cols = 1)
  
  r <- r + 1
  
  writeDataTable(new_workbook,
                 sheet = sheet,
                 x = df_1,
                 startRow = r,
                 tableStyle = "none",
                 tableName = table1name,
                 withFilter = FALSE,
                 bandedRows = FALSE,
                 headerStyle = ch,
                 keepNA = TRUE
  )
  
  # Applies style to cells of table
  addStyle(new_workbook,
           sheet = sheet,
           style = chl,
           rows = r,
           cols = 1
  )
  
  addStyle(new_workbook,
           sheet = sheet,
           style = ns,
           rows = r + 1:(r + nrow(df_1)),
           cols = num_cols,
           gridExpand = TRUE
  )
  
  addStyle(new_workbook,
           sheet = sheet,
           style = ns_percent,
           rows = r + 1:(r + nrow(df_1)),
           cols = pct_cols,
           gridExpand = TRUE
  )
  
  r <- r + 2 + nrow(df_1)
  
  writeData(new_workbook,
            sheet = sheet,
            x = paste0(t2_title),
            startRow = r,
            colNames = FALSE
  )
  
  addStyle(new_workbook,
           sheet = sheet,
           style = pt2,
           rows = r,
           cols = 1)
  
  r <- r + 1
  
  writeDataTable(new_workbook,
                 sheet = sheet,
                 x = df_2,
                 startRow = r,
                 tableStyle = "none",
                 tableName = table2name,
                 withFilter = FALSE,
                 bandedRows = FALSE,
                 headerStyle = ch,
                 keepNA = TRUE
  )
  
  # Applies style to cells of table
  addStyle(new_workbook,
           sheet = sheet,
           style = chl,
           rows = r,
           cols = 1
  )
  
  addStyle(new_workbook,
           sheet = sheet,
           style = ns,
           rows = r + 1:(r + nrow(df_2)),
           cols = num_cols,
           gridExpand = TRUE
  )
  
  addStyle(new_workbook,
           sheet = sheet,
           style = ns_percent,
           rows = r + 1:(r + nrow(df_2)),
           cols = pct_cols,
           gridExpand = TRUE
  )
  
  r <- r + 2 + nrow(df_2)
  
  if(num_tbls == 2){
    
  } else {
    writeData(new_workbook,
              sheet = sheet,
              x = paste0(t3_title),
              startRow = r,
              colNames = FALSE
    )
    
    addStyle(new_workbook,
             sheet = sheet,
             style = pt2,
             rows = r,
             cols = 1)
    
    r <- r + 1
    
    writeDataTable(new_workbook,
                   sheet = sheet,
                   x = df_3,
                   startRow = r,
                   tableStyle = "none",
                   tableName = table3name,
                   withFilter = FALSE,
                   bandedRows = FALSE,
                   headerStyle = ch,
                   keepNA = TRUE
    )
    
    # Applies style to cells of table
    addStyle(new_workbook,
             sheet = sheet,
             style = chl,
             rows = r,
             cols = 1
    )
    
    addStyle(new_workbook,
             sheet = sheet,
             style = ns,
             rows = r + 1:(r + nrow(df_3)),
             cols = num_cols,
             gridExpand = TRUE
    )
    
    addStyle(new_workbook,
             sheet = sheet,
             style = ns_percent,
             rows = r + 1:(r + nrow(df_3)),
             cols = pct_cols,
             gridExpand = TRUE
    )
  }
  
}