# commands for tagnames

## latex-lab-bib.dtx

| command           | used for    | default value | defined in |
| ------------------| --------    | ------------- | ----------|
|\LItag             | list item   |  LI           | block
| ????              | around cite | Reference     |

## latex-lab-block.dtx

| command           | used for          | default value | defined in |
| ------------------| ---------------   | ------------- | ----------|
|?????              | theorem caption   |  Caption      | 
|????               | theorem number    | Lbl           |
|\l__tag_para_main_tag_tl| various      |text-unit      | tagpdf    |
|\l__tag_para_tag_tl     | various      |text           | tagpdf    |
|\l__block_tag_name_tl | various        |               | block
|\l__tag_L_tag_tl   | list              |L  /from receipe  | block    |
|\l__block_tag_inner_tag_tl |various    | various        | block         
| ????              | label             |Lbl             |          |
| \LBody            | item body         |LBody           | block |  


## latex-lab-float.dtx

| command           | used for               | default value |
| ------------------| --------               | ------------- |
|???                | start float inside par |  text           | 
|???                | float                  | float = Aside |
|???                | caption                | Caption       |
|???                | caption number         | Lbl           |  
|???                | figures sect           | figures = Sect|
|???                | tables  sect           | tables = Sect|
  
  
## latex-lab-footnote.dtx                 
## latex-lab-graphic.dtx

| command           | used for               | default value |
| ------------------| --------               | ------------- |
|\l_tag_graphic_struct_tl| graphics          |Figure         |


## latex-lab-marginpar.dtx

| command           | used for               | default value |
| ------------------| --------               | ------------- |
|???                | marginpar              |Aside        |

## latex-lab-math.dtx

## latex-lab-minipage.dtx

| command           | used for               | default value |
| ------------------| --------               | ------------- |
|\l__ltboxes_tag_tl | boxes                  |Div        |
 


## latex-lab-table.dtx

| command           | used for    | default value |
| ------------------| --------    | ------------- |
|\l__tbl_celltag_tl  | l,r,c cells |  TD           | 
|\l__tbl_pcelltag_tl | p-cells     |  TD           |  
|\l__tbl_rowtag_tl   | rows        |  TR           |
|\l__tbl_table_tl    | table       |  Table        |





# commands for attributes-(classes) 

## latex-lab-table.dtx

| command                 | used for    | default value |
| ------------------      | --------    | ------------- |
|\l__tbl_cellattribute_tl | cells       |  empty        | 
|\l__tbl_rowattribute_tl  | rows        |  empty        |  

## latex-lab-block.dtx
 
| command                 | used for    | default value | defined in |
| ------------------      | --------    | ------------- |
|\l__tag_para_attr_class_tl |   para    |  empty        | 
|\l__tag_para_main_attr_class_tl | para-main        |  empty        | 
| \l__tag_L_attr_class_tl | list        | list, itemize ... | block  
  

# attributes

## in latex-lab-block
 newattribute = {list}{/O /List /ListNumbering/None},    
 newattribute = {itemize}{/O /List /ListNumbering/Unordered},
 newattribute = {enumerate}{/O /List /ListNumbering/Ordered},        
 newattribute = {description}{/O /List /ListNumbering/Description},
