package com.ahtcm.service.resident.impl;

import com.ahtcm.domain.CaseRecord;
import com.ahtcm.domain.HealthRecord;
import com.ahtcm.domain.Resident;
import com.ahtcm.mapper.CaseRecordMapper;
import com.ahtcm.mapper.HealthRecordMapper;
import com.ahtcm.mapper.ResidentMapper;
import com.ahtcm.service.resident.ResidentService;
import com.ahtcm.util.PageListResult;
import com.ahtcm.util.QueryVo;
import com.ahtcm.util.ReturnVo;
import com.ahtcm.util.ShiroUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class ResidentServiceImpl implements ResidentService {

    @Autowired
    ResidentMapper residentMapper;

    @Autowired
    HealthRecordMapper healthRecordMapper;

    @Autowired
    CaseRecordMapper caseRecordMapper;

    @Override
    public List<ReturnVo> getRegisterInfo() {
        Resident resident = residentMapper.getRegisterInfo(ShiroUtil.getActiveAccount());
        ReturnVo returnVo = new ReturnVo();
        returnVo.setGroup("注册信息");
        returnVo.setName("姓名");
        returnVo.setValue(resident.getResidentName());
        ReturnVo returnVo2 = new ReturnVo();
        returnVo2.setGroup("注册信息");
        returnVo2.setName("账号名");
        returnVo2.setValue(resident.getResidentAccount());
        ReturnVo returnVo3 = new ReturnVo();
        returnVo3.setGroup("注册信息");
        returnVo3.setName("电话号码");
        returnVo3.setValue(resident.getResidentPhone());
        ReturnVo returnVo4 = new ReturnVo();
        returnVo4.setGroup("注册信息");
        returnVo4.setName("社区名");
        returnVo4.setValue(resident.getResidentCommunity().getCommunityName());
        ReturnVo returnVo5 = new ReturnVo();
        returnVo5.setGroup("注册信息");
        returnVo5.setName("出生日期");
        if(resident.getResidentBirth()!=null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String timeFormat = sdf.format(resident.getResidentBirth());
            returnVo5.setValue(timeFormat);
        }
        ReturnVo returnVo6 = new ReturnVo();
        returnVo6.setGroup("注册信息");
        returnVo6.setName("性别");
        if(resident.getResidentGender()!=null){
            if(resident.getResidentGender()){
                returnVo6.setValue("男");
            }else{
                returnVo6.setValue("女");
            }
        }
        ReturnVo returnVo7 = new ReturnVo();
        returnVo7.setGroup("注册信息");
        returnVo7.setName("身高(厘米)");
        if(resident.getResidentHeight()!=null){
            returnVo7.setValue(resident.getResidentHeight());
        }
        ReturnVo returnVo8 = new ReturnVo();
        returnVo8.setGroup("注册信息");
        returnVo8.setName("体重(千克)");
        if(resident.getResidentWeight()!=null){
            returnVo8.setValue(resident.getResidentWeight());
        }
        ReturnVo returnVo9 = new ReturnVo();
        returnVo9.setGroup("注册信息");
        returnVo9.setName("户籍地址");
        if(resident.getResidentHouse()!=null){
            returnVo9.setValue(resident.getResidentHouse());
        }
        ReturnVo returnVo10 = new ReturnVo();
        returnVo10.setGroup("注册信息");
        returnVo10.setName("职业");
        if(resident.getResidentWork()!=null){
            returnVo10.setValue(resident.getResidentWork());
        }
        List<ReturnVo> vos = new ArrayList<>();
        vos.add(returnVo);
        vos.add(returnVo2);
        vos.add(returnVo3);
        vos.add(returnVo4);
        vos.add(returnVo5);
        vos.add(returnVo6);
        vos.add(returnVo7);
        vos.add(returnVo8);
        vos.add(returnVo9);
        vos.add(returnVo10);
        return vos;
    }

    @Override
    public Resident getResident() {
        return residentMapper.getRegisterInfo(ShiroUtil.getActiveAccount());
    }

    @Override
    public List<ReturnVo> getPersonalHealthRecord() {
        HealthRecord healthRecord = healthRecordMapper.selectByAccount(ShiroUtil.getActiveAccount());
        ReturnVo returnVo = new ReturnVo();
        returnVo.setName("姓名");
        returnVo.setValue(healthRecord.getName());
        ReturnVo returnVo2 = new ReturnVo();
        returnVo2.setName("账号");
        returnVo2.setValue(healthRecord.getAccount());
        ReturnVo returnVo3 = new ReturnVo();
        returnVo3.setName("社区");
        returnVo3.setValue(healthRecord.getCommunity().getCommunityName());
        ReturnVo returnVo4 = new ReturnVo();
        returnVo4.setName("高血压");
        returnVo4.setValue(healthRecord.getHighBlood()?"是":"否");
        ReturnVo returnVo5 = new ReturnVo();
        returnVo5.setName("新型冠状病毒");
        returnVo5.setValue(healthRecord.getCovid()?"是":"否");
        ReturnVo returnVo6 = new ReturnVo();
        returnVo6.setName("家族遗传病");
        returnVo6.setValue(healthRecord.getFamilyIllness());
        ReturnVo returnVo7 = new ReturnVo();
        returnVo7.setName("血型");
        returnVo7.setValue(healthRecord.getBloodType());
        ReturnVo returnVo8 = new ReturnVo();
        returnVo8.setName("色盲");
        returnVo8.setValue(healthRecord.getColorBlind());
        ReturnVo returnVo9 = new ReturnVo();
        returnVo9.setName("血糖");
        returnVo9.setValue(healthRecord.getBloodSugar());
        ReturnVo returnVo10 = new ReturnVo();
        returnVo10.setName("白血病");
        returnVo10.setValue(healthRecord.getWhiteBlood()?"是":"否");
        ReturnVo returnVo11 = new ReturnVo();
        returnVo11.setName("疫苗状况");
        returnVo11.setValue(healthRecord.getVaccin());
        ReturnVo returnVo12 = new ReturnVo();
        returnVo12.setName("备注");
        returnVo12.setValue(healthRecord.getRemark());
        return Arrays.asList(returnVo,returnVo2,returnVo3,returnVo4,returnVo5,returnVo6,returnVo7,returnVo8,returnVo9,returnVo10,returnVo11,returnVo12);
    }

    @Override
    public PageListResult getPersonalCaseRecordList(QueryVo vo) {
        Page<Object> page = PageHelper.startPage(vo.getPage(), vo.getRows());
        List<CaseRecord> records = caseRecordMapper.getPersonalCaseRecordList(vo.getKeyword(),ShiroUtil.getActiveAccount());
        PageListResult pageListResult = new PageListResult();
        pageListResult.setTotal(page.getTotal());
        pageListResult.setRows(records);
        return pageListResult;
    }
}
