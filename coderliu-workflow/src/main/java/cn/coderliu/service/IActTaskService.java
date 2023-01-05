package cn.coderliu.service;


import cn.coderliu.dto.ActTaskDTO;
import cn.coderliu.dto.ActWorkflowFormDataDTO;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.text.ParseException;
import java.util.List;

public interface IActTaskService {
    public Page<ActTaskDTO> selectProcessDefinitionList(Page<ActTaskDTO> pageDomain);
    public List<String>formDataShow(String taskID);
    public int formDataSave(String taskID, List<ActWorkflowFormDataDTO> awfs) throws ParseException;
}
