package org.hanzhdy.manager.upc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hanzhdy.manager.support.bean.SessionUser;
import org.hanzhdy.manager.support.constants.resp.RespResult;
import org.hanzhdy.manager.support.controller.ApplicationController;
import org.hanzhdy.manager.upc.controller.params.DictDataParams;
import org.hanzhdy.manager.upc.model.DictData;
import org.hanzhdy.manager.upc.model.DictType;
import org.hanzhdy.manager.upc.service.DictDataService;
import org.hanzhdy.manager.upc.service.DictTypeService;
import org.hanzhdy.web.bean.DatatableResult;
import org.hanzhdy.web.throwable.BizException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

/**
 * @description 数据字典管理Controller
 * @author H.CAAHN
 * @createtime 2016年10月9日 上午12:09:30
 */
@Controller
@RequestMapping("/basic/dictdata")
public class DictDataController extends ApplicationController {
    @Autowired
    private DictDataService     dictDataService;
    
    @Autowired
    private DictTypeService     dictTypeService;
    
    /** 日志对象 */
    private static final Logger logger = LoggerFactory.getLogger(DictDataController.class);
    
    /**
     * 转到数据字典管理列表页面
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String toList(Model model) {
        try {
            List<DictType> typeList = this.dictTypeService.queryAsList();
            model.addAttribute("typeList", typeList);
        }
        catch (Exception ex) {
            logger.error("转到数据字典管理列表页面失败", ex);
        }
        return "/basic/dictdata/dictdata-list";
    }
    
    /**
     * 请求获取数据字典列表数据
     * @param params
     * @param request
     * @return
     */
    @RequestMapping(value = "dataList", method = RequestMethod.POST)
    @ResponseBody
    public Object dataList(DictDataParams params, HttpServletRequest request) {
        try {
            DatatableResult dataResult = dictDataService.queryAsDatatableResult(params);
            return JSON.toJSONString(dataResult);
        }
        catch (BizException ex) {
            logger.error("查询数据字典数据失败，查询参数：{}, 错误信息：[{}, {}]", JSON.toJSONString(params), ex.getCode(), ex.getMsg());
        }
        catch (Exception ex) {
            logger.error("查询数据字典数据失败，查询参数：" + JSON.toJSONString(params), ex);
        }
        return null;
    }
    
    /**
     * 跳转到编辑页面
     * @param id
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "toEdit", method = RequestMethod.GET)
    public String toEdit(Long id, Model model, HttpServletRequest request) {
        // 查询字典类型
        List<DictType> typeList = this.dictTypeService.queryAsList();
        model.addAttribute("typeList", typeList);
        
        // 查询数据字典信息
        if (id != null && id > 0) {
            DictData record = dictDataService.queryById(id);
            if (record != null) {
                model.addAttribute("record", record);
                return "/basic/dictdata/dictdata-edit";
            }
            return redirect(REDIRECT_404);
        }
        return "/basic/dictdata/dictdata-edit";
    }
    
    /**
     * 处理保存数据字典信息请求
     * @param record
     * @param request
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ResponseBody
    public Object saveUser(DictData record, HttpServletRequest request) {
        SessionUser user = super.getSessionUser(request);
        try {
            // 执行新增或更新操作
            boolean result = false;
            if (record.getId() == null) {
                record.setCreator(user.getId());
                result = this.dictDataService.insert(record);
            }
            else {
                record.setUpdater(user.getId());
                result = this.dictDataService.update(record);
            }
            
            // 处理返回结果
            return RespResult.create(result ? respCode.SUCCESS : respCode.SAVE_NORECORD);
        }
        catch (BizException ex) {
            logger.error("保存数据字典信息失败，数据参数：{}, 错误信息：[{}, {}]", JSON.toJSONString(record), ex.getCode(), ex.getMsg());
            return RespResult.create(ex.getCode(), ex.getMsg());
        }
        catch (Exception ex) {
            logger.error("保存数据字典信息失败，数据参数：" + JSON.toJSONString(record), ex);
            return RespResult.create(respCode.ERROR_EXCEPTION);
        }
    }
    
    /**
     * 处理更新数据字典数据状态请求
     * @param record
     * @param request
     * @return
     */
    @RequestMapping(value = "updateStatus", method = RequestMethod.POST)
    @ResponseBody
    public Object updateStatus(DictData record, HttpServletRequest request) {
        SessionUser user = super.getSessionUser(request);
        try {
            record.setUpdater(user.getId());
            this.dictDataService.updateStatus(record);
            return RespResult.create(respCode.SUCCESS);
        }
        catch (BizException ex) {
            logger.error("更新数据字典数据状态失败，数据参数：{}, 错误信息：[{}, {}]", JSON.toJSONString(record), ex.getCode(), ex.getMsg());
            return RespResult.create(ex.getCode(), ex.getMsg());
        }
        catch (Exception ex) {
            logger.error("更新数据字典数据状态失败，数据参数：" + JSON.toJSONString(record), ex);
            return RespResult.create(respCode.ERROR_EXCEPTION);
        }
    }
}
