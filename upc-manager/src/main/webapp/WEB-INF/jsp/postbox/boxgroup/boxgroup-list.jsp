<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/jsp/commons/include.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>箱子组管理</title>
    <jsp:include page="/WEB-INF/jsp/commons/metaheader.jsp" />
    <link href="${ctx}/css/list.css" rel="stylesheet" type="text/css" />
  </head>
  <body class="skin-blue sidebar-mini">
  <div id="content" style="background-color:#ecf0f5">
    <section class="content-header">
      <h1><small>单元柜管理 &gt; 箱子组管理</small></h1>
    </section>
  <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <form class="form-inline legend">
                <div class="form-group">
                  <label class="sr-only" for="groupName">箱子组名称</label>
                    <input type="text" class="form-control" id="groupName" placeholder="箱子组名称"/>
                </div>
                <div class="form-group">
                  <label class="sr-only" for="province">省份</label>
                  <select id="province" name="province" class="form-control">
                    <option value=""> --- 选择省份 --- </option>
                    <c:forEach items="${provinceList}" var="province">
                      <option value="${province.name}" area-node="${province.node}">${province.name}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="form-group">
                  <label class="sr-only" for="city">城市</label>
                  <select id="city" name="city" class="form-control">
                    <option value=""> --- 选择城市 --- </option>
                  </select>
                </div>
                <div class="form-group">
                  <label class="sr-only" for="repairerInfoId">维修员</label>
                  <select id="repairerInfoId" name="city" class="form-control">
                    <option value=""> --- 选择维修员 --- </option>
                  </select>
                </div>
                <div class="form-group">
                  <label class="sr-only" for="status">状态</label>
                  <select id="status" class="form-control">
                      <option value=""> --- 选择状态 --- </option>
                      <c:forEach items="${statusList}" var="s">
                      <option value="${s}">${s.remark}</option>
                      </c:forEach>
                  </select>
                </div>
                <button type="button" class="btn btn-primary search">&nbsp;&nbsp;搜索&nbsp;&nbsp;</button>
                <button type="reset" class="btn btn-warning reset">&nbsp;&nbsp;重置&nbsp;&nbsp;</button>
              </form>
              <!-- <div class="btn-group"> -->
                <button class="btn btn-info add-btn">&nbsp;&nbsp;新增&nbsp;&nbsp;</button>
              <!-- </div> -->
            </div><!-- /.box-header -->
            <div class="box-body">
              <table id="dataList" class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <th style="width:12%">箱子组名称</th>
                    <th style="width:12%">联系方式</th>
                    <th style="width:12%">省份</th>
                    <th style="width:12%">城市</th>
                    <th style="width:12%">状态</th>
                    <th style="width:20%">创建时间</th>
                    <th style="width:20%">操作</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div><!-- /.box-body -->
          </div><!-- /.box -->
        </div><!-- /.col -->
      </div><!-- /.row -->
    </section><!-- /.content -->
</div>
    <jsp:include page="/WEB-INF/jsp/commons/metafooter.jsp" />
    <script type="text/javascript" src="${ctx}/js/postbox/boxgroup/boxgroup-list.js<c:if test='${not empty crm}'>?${crm}</c:if>"></script>
  </body>
</html>