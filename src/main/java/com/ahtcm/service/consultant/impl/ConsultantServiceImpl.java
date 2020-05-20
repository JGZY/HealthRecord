package com.ahtcm.service.consultant.impl;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.ahtcm.ajaxResponse.impl.CommonCode;
import com.ahtcm.ajaxResponse.impl.FileCode;
import com.ahtcm.ajaxResponse.impl.HealthRecordCode;
import com.ahtcm.domain.*;
import com.ahtcm.mapper.*;
import com.ahtcm.service.consultant.ConsultantService;
import com.ahtcm.util.BrowserEncodeSwitchUtil;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.ahtcm.util.ShiroUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Service
public class ConsultantServiceImpl implements ConsultantService {

    @Autowired
    HealthRecordMapper healthRecordMapper;

    @Autowired
    ConsultantMapper consultantMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    ResidentMapper residentMapper;

    @Autowired
    CaseRecordMapper caseRecordMapper;

    @Override
    public PageListResult getHealthRecordList(QueryVo vo) {
        Page<Object> page = PageHelper.startPage(vo.getPage(), vo.getRows());
        User user = ShiroUtil.getActiveUser();
        Consultant consultant = consultantMapper.selectByPrimaryKey(user.getUid());
        //给系统管理员分配该菜单时，报错处理
        Long id;
        try{
            id = consultant.getCommunity().getId();
        }catch (Exception e){
            id = null;
        }
        List<HealthRecord> healthRecords = healthRecordMapper.selectAll(vo.getKeyword(),id);
        PageListResult pageListResult = new PageListResult();
        pageListResult.setTotal(page.getTotal());
        pageListResult.setRows(healthRecords);
        return pageListResult;
    }

    @Override
    public String getConsultantCommunityId() {
        User user = ShiroUtil.getActiveUser();
        Consultant consultant = consultantMapper.selectByPrimaryKey(user.getUid());
        return consultant.getCommunity().getId().toString();
    }

    @Override
    public AjaxRes insertHealthRecord(HealthRecord healthRecord) {
        String account = healthRecord.getAccount();
        User user = userMapper.selectUserByAccount(account);
        if(user==null){
            return HealthRecordCode.HAS_NOT_USER;
        }else{
            Long uid = user.getUid();
            Resident resident = residentMapper.selectByPrimaryKey(uid);
            if(!resident.getResidentName().equals(healthRecord.getName())){
                return HealthRecordCode.ACCOUNT_NOT_PATTEN_NAME;
            }
        }
        HealthRecord record = healthRecordMapper.selectByAccount(account);
        if(record!=null){
            return HealthRecordCode.REPEAT_INFO;
        }
        try {
            healthRecordMapper.insert(healthRecord);
            return CommonCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }

    @Override
    public AjaxRes editHealthRecord(HealthRecord healthRecord) {
        HealthRecord record = healthRecordMapper.selectByPrimaryKey(healthRecord.getId());
        if(!record.getAccount().equals(healthRecord.getAccount())){
            return HealthRecordCode.BAN_UPDATE_ACCOUNT;
        }
        Resident resident = residentMapper.selectByAccount(record.getAccount());
        if(!resident.getResidentName().equals(healthRecord.getName())){
            return HealthRecordCode.ISNOTSAME_NAME;
        }
        try{
            healthRecordMapper.updateByPrimaryKey(healthRecord);
            return CommonCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }

    @Override
    public PageListResult getCaseRecordList(QueryVo vo) {
        Page<Object> page = PageHelper.startPage(vo.getPage(), vo.getRows());
        User user = ShiroUtil.getActiveUser();
        Consultant consultant = consultantMapper.selectByPrimaryKey(user.getUid());
        Long id;
        try{
            id = consultant.getId();
        }catch (Exception e){
            id = null;
        }
        List<CaseRecord> records = caseRecordMapper.selectAll(vo.getKeyword(),id);
        PageListResult pageListResult = new PageListResult();
        pageListResult.setTotal(page.getTotal());
        pageListResult.setRows(records);
        return pageListResult;
    }

    @Override
    public AjaxRes insertCaseRecord(CaseRecord caseRecord) {
        Resident r = residentMapper.selectByAccount(caseRecord.getResident().getResidentAccount());
        if(r==null){
            return HealthRecordCode.NULL_RESIDENT;
        }else{
            caseRecord.setResident(r);
        }
        caseRecord.setCreateTime(new Date());
        String account = ShiroUtil.getActiveAccount();
        Consultant consultant = consultantMapper.selectByAccount(account);
        if(consultant==null){
            return HealthRecordCode.BAN_INSERT_CASE;
        }else{
            caseRecord.setConsultant(consultant);
        }
        try{
            caseRecordMapper.insert(caseRecord);
            return CommonCode.SUCCESS;
        }catch (Exception e){
            return CommonCode.FAIL;
        }
    }

    @Override
    public void downloadExcelTpl(HttpServletRequest request, HttpServletResponse response) {
        FileInputStream is = null;
        try{
            String fileName = "居民病历导入模板.xls";
            String contentDisposition = BrowserEncodeSwitchUtil.getContentDisposition(fileName, request);
            response.setHeader("Content-Disposition", contentDisposition);
            /*获取文件的路径*/
            String realPath = request.getSession().getServletContext().getRealPath("/static/居民病历导入模板.xls");
            /*读取文件*/
            is=new FileInputStream(realPath);
            IOUtils.copy(is,response.getOutputStream());
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(is !=null){
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    //上传Excel  这里写的有点问题，先不管了  写自闭了
    @Override
    public AjaxRes uploadExcelFile(MultipartFile file, HttpServletResponse response) {
        if(file==null) {
            return new FileCode(false,6000,"文件不存在");
        }
        try{
            Workbook workbook = new HSSFWorkbook(file.getInputStream());
            Sheet sheet = workbook.getSheetAt(0);
            List<CaseRecord> records= new LinkedList<>();
            Consultant consultant = new Consultant();
            consultant.setId(ShiroUtil.getActiveUser().getUid());
            for(int i=1;i<=sheet.getLastRowNum();i++){
                Row row = sheet.getRow(i);
                CaseRecord caseRecord = new CaseRecord();
                String residentAccount = (String) getCellValue(row.getCell(0));
                Resident resident = residentMapper.selectByAccount(residentAccount);
                if(resident==null){
                    break;
                }else{
                    caseRecord.setResident(resident);
                }
                caseRecord.setCreateTime(new Date());
                caseRecord.setHospital((String) getCellValue(row.getCell(1)));
                caseRecord.setDept((String) getCellValue(row.getCell(2)));
                Cell cell3 = row.getCell(3);
                cell3.setCellType(CellType.STRING);
                caseRecord.setCode((String)getCellValue(row.getCell(3)));
                caseRecord.setComplain((String) getCellValue(row.getCell(4)));
                caseRecord.setHistory((String) getCellValue(row.getCell(5)));
                caseRecord.setDiagnose((String) getCellValue(row.getCell(6)));
                caseRecord.setConsultant(consultant);
                caseRecord.setView((String) getCellValue(row.getCell(7)));
                Cell cell = row.getCell(8);
                cell.setCellType(CellType.STRING);
                caseRecord.setStatus((String) getCellValue(cell));
                records.add(caseRecord);
            }
            for (CaseRecord record : records) {
                caseRecordMapper.insert(record);
                //List<CaseRecord> caseRecords = caseRecordMapper.selectList();
            }
            return CommonCode.SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return CommonCode.FAIL;
        }
    }

    @Override
    public void downloadExcel(HttpServletRequest request, HttpServletResponse response) {
        List<CaseRecord> records = caseRecordMapper.selectAll(null, ShiroUtil.getActiveUser().getUid());
        HSSFWorkbook workbook = new HSSFWorkbook();
        Sheet sheet = workbook.createSheet("居民病历数据");
        //设置列宽
        sheet.setDefaultColumnWidth(20);
        Row row = sheet.createRow(0);
        row.createCell(0).setCellValue("居民姓名(账号)");
        row.createCell(1).setCellValue("病历时间");
        row.createCell(2).setCellValue("医院");
        row.createCell(3).setCellValue("科室");
        row.createCell(4).setCellValue("主诉");
        row.createCell(5).setCellValue("病史");
        row.createCell(6).setCellValue("诊断");
        row.createCell(7).setCellValue("医师姓名(账号)");
        row.createCell(8).setCellValue("意见");
        row.createCell(9).setCellValue("初诊/复诊");
        row.createCell(10).setCellValue("病历号");
        Row recordRow;
        for(int i= 0;i<records.size();i++){
            CaseRecord caseRecord = records.get(i);
            recordRow = sheet.createRow(i + 1);
            recordRow.createCell(0).setCellValue(caseRecord.getResident().getResidentName()+"("+caseRecord.getResident().getResidentAccount()+")");
            Date createTime = caseRecord.getCreateTime();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String time = simpleDateFormat.format(createTime);
            recordRow.createCell(1).setCellValue(time);
            recordRow.createCell(2).setCellValue(caseRecord.getHospital());
            recordRow.createCell(3).setCellValue(caseRecord.getDept());
            recordRow.createCell(4).setCellValue(caseRecord.getComplain());
            recordRow.createCell(5).setCellValue(caseRecord.getHistory());
            recordRow.createCell(6).setCellValue(caseRecord.getDiagnose());
            recordRow.createCell(7).setCellValue(caseRecord.getConsultant().getConsultantName()+"("+caseRecord.getConsultant().getConsultantAccount()+")");
            recordRow.createCell(8).setCellValue(caseRecord.getView());
            String value  = "0".equals(caseRecord.getStatus())?"初诊":"复诊";
            recordRow.createCell(9).setCellValue(value);
            recordRow.createCell(10).setCellValue(caseRecord.getCode());
        }
        /*文件下载*/
        try {
            Date date = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String format = simpleDateFormat.format(date);
            String name = "居民病历数据_"+format+".xls";
            String fileName= new String(name.getBytes(StandardCharsets.UTF_8),"iso8859-1");
            response.setHeader("content-Disposition","attachment;fileName="+fileName);
            workbook.write(response.getOutputStream());
        }catch (Exception e){
            e.printStackTrace();
        }
    }

/*    //生成错误数据的excel的方法
    private void createErrorExcel(List<Row> errors,HttpServletResponse response) {
        HSSFWorkbook workbook = new HSSFWorkbook();
        *//*创建一页*//*
        HSSFSheet sheet = workbook.createSheet("错误数据");
        for(int i = 0;i<errors.size();i++){
            Row row = sheet.createRow(i);
            Row errorRow = errors.get(i);
            for(int j = 0; j< errorRow.getLastCellNum(); i++){
                String cellValue = errorRow.getCell(j).getStringCellValue();
                if(cellValue==null){
                    cellValue = "";
                }
                row.createCell(j).setCellValue(cellValue);
            }
        }
        try{
            Date date = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String format = simpleDateFormat.format(date);
            String name = "错误数据总计_"+format+".xls";
            String fileName= new String(name.getBytes(StandardCharsets.UTF_8),"iso8859-1");
            response.setHeader("content-Disposition","attachment;fileName="+fileName);
            workbook.write(response.getOutputStream());
        }catch (Exception e){
            e.printStackTrace();
        }
    }*/

    /*获取excel每一个表格的值*/
    private Object getCellValue(Cell cell){
        switch (cell.getCellType()){
            case STRING:
                return cell.getRichStringCellValue().getString();
            case NUMERIC:
                if(DateUtil.isCellDateFormatted(cell)){
                    return cell.getDateCellValue();
                }else {
                    return cell.getNumericCellValue();
                }
            case BOOLEAN:
                return cell.getBooleanCellValue();
            case FORMULA:
                return cell.getCellFormula();
        }
        return cell;
    }
}
