#' 信用额度生成生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' creditModelUI()
creditModelUI <- function(tabTitle ='信用额度',
                         colTitles =c('操作区域','操作区域','显示区域'),
                         widthRates =c(6,6,12),
                         func_left = creditModelUI_left,
                         func_right =creditModelUI_right,
                         func_bottom = creditModelUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' creditModelUI_left()
creditModelUI_left <- function() {


  res <- tagList(

    tsui::layout_2C(x=tsui::mdl_text2(id = 'text_creditModel_FCalculateYear',label ='计算年度' ,value ='2025' ),
                    y=tsui::mdl_text2(id = 'text_creditModel_FCalculationPeriod',label ='计算期间' ,value ='4')),


    tsui::layout_2C(x=tsui::mdl_text2(id = 'text_creditModel_FLatestVersion',label ='最新版本号' ,value ='1' ),
                    y=tsui::mdl_text2(id = 'text_creditModel_FVersion',label ='版本号' ,value ='1'))
)

  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' creditModelUI_bottom()
creditModelUI_right <- function() {
  res <- tagList(

    shiny::actionButton(inputId = 'btn_creditModel_select',label = '查询'),

    tsui::mdl_download_button(id = 'dl_creditModel',label = '下载信用额度至EXCEL')



  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' creditModelUI_bottom()
creditModelUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'creditModel_resultView',label ='结果显示' ))

  )
  return(res)

}
