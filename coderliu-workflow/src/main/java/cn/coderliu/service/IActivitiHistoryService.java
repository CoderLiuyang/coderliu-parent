package cn.coderliu.service;


import cn.coderliu.dto.ActivitiHighLineDTO;

public interface IActivitiHistoryService {
    public ActivitiHighLineDTO gethighLine(String instanceId);
}
