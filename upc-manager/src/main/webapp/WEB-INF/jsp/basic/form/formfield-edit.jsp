<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/commons/include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>编辑表单字段信息</title>
    <jsp:include page="/WEB-INF/jsp/commons/editheader.jsp" />
  </head>
  <body>
    <nav class="navbar navbar-default navbar-fixed-top" style="min-height:40px;">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="javascript:void(0);" style="height:40px;line-height:8px;">编辑表单字段信息</a>
        </div>
      </div>
    </nav>
    <div class="container" style="width:100%;margin-top:50px;padding-left:10px;padding-right:10px;">
      <form id="submitForm" class="form-horizontal" action="${ctx}/basic/form/saveFormField" method="POST">
        <input type="hidden" name="formId" value="${record.formId}"/>
        <input type="hidden" name="fieldId" value="${record.fieldId}"/>
        <table class="table table-bordered table-hover">
          <tr>
            <td style="width:16%;text-align:right;">表单编码：</td>
            <td style="width:32%;padding:4px;">
              <input class="form-control input-sm myspan6" type="text" value="${formInfo.formcode}" disabled="disabled">
            </td>
            <td style="width:16%;text-align:right;">表单名称：</td>
            <td style="width:32%;padding:4px;">
              <input class="form-control input-sm myspan6" type="text" value="${formInfo.formname}" disabled="disabled">
            </td>
          </tr>
          <tr>
            <td style="width:16%;text-align:right;">字段编码：</td>
            <td style="width:32%;padding:4px;">
              <input class="form-control input-sm myspan6" type="text" value="${fieldInfo.fieldcode}" disabled="disabled">
            </td>
            <td style="width:16%;text-align:right;">字段名称：</td>
            <td style="width:32%;padding:4px;">
              <input class="form-control input-sm myspan6" type="text" value="${fieldInfo.fieldname}" disabled="disabled">
            </td>
          </tr>
          <tr>
            <td style="width:16%;text-align:right;">所占列数：</td>
            <td style="width:32%;padding:4px;">
              <input name="colspan" class="form-control input-sm myspan6" type="text" placeholder="所占列数" value="${record.colspan}">
            </td>
            <td style="width:16%;text-align:right;">排序：</td>
            <td style="width:32%;padding:4px;">
              <input name="sort" class="form-control input-sm myspan6" type="text" placeholder="排序" value="${record.sort}">
            </td>
          </tr>
        </table>
      </form>
    </div>
    <div class="well center-block" style="left:10px;right:10px;position:fixed;bottom:0px;padding:10px;">
      <button type="button" class="btn btn-primary submit">&nbsp;&nbsp;保&nbsp;存&nbsp;&nbsp;</button>
      <button type="button" class="btn btn-warning" onclick="window.close();" style="float:right">&nbsp;&nbsp;关&nbsp;闭&nbsp;&nbsp;</button>
    </div>
  </body>
  <jsp:include page="/WEB-INF/jsp/commons/editfooter.jsp" />
  <script src="${ctx}/js/basic/form/formfield-edit.js<c:if test='${not empty crm}'>?${crm}</c:if>" type="text/javascript"></script>
</html>